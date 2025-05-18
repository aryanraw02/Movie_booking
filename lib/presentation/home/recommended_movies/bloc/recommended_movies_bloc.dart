/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'dart:async';
import 'package:cinema_booking/domain/entities/response/home.dart';
import 'package:cinema_booking/presentation/home/bloc/home_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'recommended_movies_event.dart';
part 'recommended_movies_state.dart';

class RecommendedMoviesBloc
    extends Bloc<RecommendedMoviesEvent, RecommendedMoviesState> {
  final HomeBloc homeBloc;
  late StreamSubscription subscription;

  RecommendedMoviesBloc({required this.homeBloc})
    : super(RecommendedMoviesNotLoaded()) {
    on<DisplayRecommendedMovies>(_onDisplayRecommendedMovies);
    if (homeBloc.state is HomeLoaded) {
      final state = homeBloc.state as HomeLoaded;
      add(DisplayRecommendedMovies(state.homeState.recommendedMovies));
    } else {
      subscription = homeBloc.stream.listen((state) {
        if (state is HomeLoaded) {
          add(DisplayRecommendedMovies(state.homeState.recommendedMovies));
        }
      });
    }
  }

  Future<void> _onDisplayRecommendedMovies(
    DisplayRecommendedMovies event,
    Emitter<RecommendedMoviesState> emit,
  ) async {
    emit(RecommendedMoviesLoaded(event.movies));
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
