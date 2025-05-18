/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'dart:async';
import 'package:cinema_booking/domain/entities/genres/genres.dart';
import 'package:cinema_booking/presentation/home/bloc/home_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_genres_event.dart';
part 'home_genres_state.dart';

class HomeGenresBloc extends Bloc<HomeGenresEvent, HomeGenresState> {
  final HomeBloc homeBloc;
  late final StreamSubscription _subscription;

  HomeGenresBloc({required this.homeBloc}) : super(HomeGenresNotLoaded()) {
    on<DisplayHomeGenres>(_onDisplayHomeGenres);

    if (homeBloc.state is HomeLoaded) {
      final state = homeBloc.state as HomeLoaded;
      add(DisplayHomeGenres(state.homeState.genres));
    } else {
      _subscription = homeBloc.stream
          .where((state) => state is HomeLoaded)
          .distinct()
          .listen((state) {
            if (state is HomeLoaded) {
              add(DisplayHomeGenres(state.homeState.genres));
            }
          });
    }
  }

  Future<void> _onDisplayHomeGenres(
    DisplayHomeGenres event,
    Emitter<HomeGenresState> emit,
  ) async {
    emit(HomeGenresLoaded(event.genres));
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }
}
