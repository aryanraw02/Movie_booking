/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-22 08:45:56
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'dart:async';

import 'package:cinema_booking/common/helpers/log_helpers.dart';
import 'package:cinema_booking/core/enum/type_seat.dart';
import 'package:cinema_booking/domain/entities/booking/booking_time_slot.dart';
import 'package:cinema_booking/domain/entities/movies/movies.dart';
import 'package:cinema_booking/domain/entities/show_time/time_slot.dart';
import 'package:cinema_booking/domain/usecase/booking_time/get_cached_book_time_slot.dart';
import 'package:cinema_booking/domain/usecase/booking_time/get_cached_selected_time_slot.dart';
import 'package:cinema_booking/domain/usecase/booking_time/get_cached_show.dart';
import 'package:cinema_booking/presentation/booking/booking_seat_type/bloc/book_seat_type_state.dart';
import 'package:cinema_booking/service_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_seat_type_event.dart';

class BookSeatTypeBloc extends Bloc<BookSeatTypeEvent, BookSeatTypeState> {
  BookSeatTypeBloc() : super(const BookSeatTypeState()) {
    on<OpenScreen>(_onOpenScreen);
    on<ClickHowManySeat>(_onClickHowManySeat);
    on<ClickSelectSeatType>(_onClickSelectSeatType);
    on<ClickSelectSeats>(_onClickSelectSeats);
    on<OpenedBookSeatSlotScreen>(_onOpenedBookSeatSlotScreen);
  }

  Future<void> _onOpenScreen(
    OpenScreen event,
    Emitter<BookSeatTypeState> emit,
  ) async {
    try {
      MovieEntity? movie;
      TimeSlotEntity? selectedTimeSlot;
      BookTimeSlotEntity? bookTimeSlot;

      final movieData = await sl<GetCachedMovieUseCase>().call();
      final selectedTimeSlotData =
          await sl<GetCachedSelectedTimeSlotUseCase>().call();
      final bookTimeSlotData = await sl<GetCachedBookTimeSlotUseCase>().call();

      movieData.fold(
        (error) {
          LogHelper.error(
            tag: 'OpenScreen Error',
            message: "BookSeatTypeBloc movieData $error",
          );
        },
        (data) {
          movie = data;
        },
      );
      selectedTimeSlotData.fold(
        (error) {
          LogHelper.error(
            tag: 'OpenScreen Error',
            message: "BookSeatTypeBloc selectedTimeSlotData $error",
          );
        },
        (data) {
          selectedTimeSlot = data;
        },
      );
      bookTimeSlotData.fold(
        (error) {
          LogHelper.error(
            tag: 'OpenScreen Error',
            message: "BookSeatTypeBloc bookTimeSlotData $error",
          );
        },
        (data) {
          bookTimeSlot = data;
        },
      );

      emit(
        state.copyWith(
          movie: movie,
          selectedTimeSlot: selectedTimeSlot,
          bookTimeSlot: bookTimeSlot,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  void _onClickHowManySeat(
    ClickHowManySeat event,
    Emitter<BookSeatTypeState> emit,
  ) {
    emit(state.copyWith(seatCount: event.seatCount));
  }

  void _onClickSelectSeatType(
    ClickSelectSeatType event,
    Emitter<BookSeatTypeState> emit,
  ) {
    emit(state.copyWith(selectedSeatType: event.selectedSeatType));
  }

  void _onClickSelectSeats(
    ClickSelectSeats event,
    Emitter<BookSeatTypeState> emit,
  ) {
    emit(state.copyWith(isOpenBookSeatSlotScreen: true));
  }

  void _onOpenedBookSeatSlotScreen(
    OpenedBookSeatSlotScreen event,
    Emitter<BookSeatTypeState> emit,
  ) {
    emit(state.copyWith(isOpenBookSeatSlotScreen: false));
  }
}
