/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-02-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'dart:async';

import 'package:cinema_booking/domain/entities/cinema/cinema.dart';
import 'package:cinema_booking/presentation/home/bloc/home_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nearby_cinema_event.dart';
part 'nearby_cinema_state.dart';

class NearbyCineBloc extends Bloc<NearbyCineEvent, NearbyCineState> {
  final HomeBloc homeBloc;
  late StreamSubscription subscription;

  NearbyCineBloc({required this.homeBloc}) : super(NearbyCineNotLoaded()) {
    on<DisplayNearbyCine>(_onDisplayNearbyCine);

    if (homeBloc.state is HomeLoaded) {
      final state = homeBloc.state as HomeLoaded;
      add(DisplayNearbyCine(cines: state.homeState.nearbyCinemas));
    } else {
      subscription = homeBloc.stream.listen((state) {
        if (state is HomeLoaded) {
          add(DisplayNearbyCine(cines: state.homeState.nearbyCinemas));
        }
      });
    }
  }

  Future<void> _onDisplayNearbyCine(
    DisplayNearbyCine event,
    Emitter<NearbyCineState> emit,
  ) async {
    emit(NearbyCineLoaded(cines: event.cines));
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
