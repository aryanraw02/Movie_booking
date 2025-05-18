/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'dart:async';

import 'package:cinema_booking/domain/entities/genres/genres.dart';
import 'package:cinema_booking/domain/entities/response/home.dart';
import 'package:cinema_booking/presentation/home/bloc/home_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_movies_genres_event.dart';
part 'home_movies_genres_state.dart';

class HomeMoviesGenresBloc
    extends Bloc<HomeMoviesGenresEvent, HomeMoviesGenresState> {
  final HomeBloc homeBloc;
  late StreamSubscription subscription;

  HomeMoviesGenresBloc({required this.homeBloc})
    : super(MoviesByGenresNotLoaded()) {
    on<DisplayMoviesByGenres>(_onDisplayMoviesByGenres);

    if (homeBloc.state is HomeLoaded) {
      final state = homeBloc.state as HomeLoaded;
      add(DisplayMoviesByGenres(state.homeState));
    } else {
      subscription = homeBloc.stream.listen((state) {
        if (state is HomeLoaded) {
          add(DisplayMoviesByGenres(state.homeState));
        }
      });
    }
  }

  Future<void> _onDisplayMoviesByGenres(
    DisplayMoviesByGenres event,
    Emitter<HomeMoviesGenresState> emit,
  ) async {
    List<MapEntry<GenresEntity, List<MovieDetailEntity>>> list = [];

    final homeResponse = event.homeResponse;

    for (var data in homeResponse.movieByGenres) {
      final genres = homeResponse.genres.firstWhere((genres) {
        return genres.id == data.genresId;
      });
      list.add(MapEntry(genres, data.movies));
    }

    emit(MoviesByGenresLoaded(list: list));
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
