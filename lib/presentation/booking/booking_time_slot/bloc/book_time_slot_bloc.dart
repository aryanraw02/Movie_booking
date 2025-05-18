/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-22 08:45:56
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'dart:async';
import 'package:cinema_booking/common/helpers/log_helpers.dart';
import 'package:cinema_booking/data/models/cinema/cinema.dart';
import 'package:cinema_booking/data/models/response/booking_time_slot_by_cinema_response.dart';
import 'package:cinema_booking/data/models/show_time/time_slot.dart';
import 'package:cinema_booking/domain/entities/booking/booking_time_slot.dart';
import 'package:cinema_booking/domain/entities/show_time/time_slot.dart';
import 'package:cinema_booking/domain/usecase/booking_time/cache_book_time_slot.dart';
import 'package:cinema_booking/domain/usecase/booking_time/cache_selected_time_slot.dart';
import 'package:cinema_booking/domain/usecase/booking_time/get_all_shows_by_type.dart';
import 'package:cinema_booking/presentation/booking/booking_time_slot/bloc/book_time_slot_state.dart';
import 'package:cinema_booking/core/enum/sort_booking_time_slot.dart';
import 'package:cinema_booking/service_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_time_slot_event.dart';

class BookTimeSlotBloc extends Bloc<BookTimeSlotEvent, BookTimeSlotState> {
  String movieId = "";

  BookTimeSlotBloc() : super(const BookTimeSlotState(isLoading: true)) {
    on<OpenScreen>(_onOpenScreen);
    on<ClickIconSearch>(_onClickIconSearch);
    on<ClickCloseSearch>(_onClickCloseSearch);
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<SelectTimeSlot>(_onSelectTimeSlot);
    on<OpenedBookSeatTypeScreen>(_onOpenedBookSeatTypeScreen);
  }

  Future<void> _onOpenScreen(
    OpenScreen event,
    Emitter<BookTimeSlotState> emit,
  ) async {
    try {
      final response = await sl<GetAllMoviesByTypeUseCase>().call(
        movieId: movieId,
      );

      response.fold(
        (error) {
          LogHelper.error(
            tag: 'OpenScreen Error',
            message: "BookTimeSlotBloc $error",
          );
        },
        (data) {
          final updatedState = state.copyWith(
            isLoading: false,
            list: _toBookTimeSlots(data),
          );
          emit(updatedState);
        },
      );
    } catch (e) {
      emit(state.copyWith(msg: e.toString()));
    }
  }

  void _onClickIconSearch(
    ClickIconSearch event,
    Emitter<BookTimeSlotState> emit,
  ) {
    final updatedState = state.copyWith(
      isLoading: false,
      movieSearchField: true,
    );
    emit(updatedState);
  }

  void _onClickCloseSearch(
    ClickCloseSearch event,
    Emitter<BookTimeSlotState> emit,
  ) async {
    final updatedState = state.copyWith(movieSearchField: false);
    emit(updatedState);

    await _onSearchQueryChanged(SearchQueryChanged(keyword: ""), emit);
  }

  Future<void> _onSearchQueryChanged(
    SearchQueryChanged event,
    Emitter<BookTimeSlotState> emit,
  ) async {
    LogHelper.debug(
      tag: 'SearchQueryChanged',
      message: 'Keyword: ${event.keyword}',
    );
    emit(state.copyWith(isLoading: true));

    try {
      final response = await sl<GetAllMoviesByTypeUseCase>().call(
        movieId: movieId,
      );

      response.fold(
        (error) {
          // emit(BookTimeSlotError(error));
          LogHelper.error(
            tag: 'OpenScreen Error',
            message: "_onSearchQueryChanged $error",
          );
        },
        (data) {
          final query = _filterFake(event.keyword);
          final result = data.where(query).toList();

          final updatedState = state.copyWith(
            isLoading: false,
            list: _toBookTimeSlots(result),
          );
          emit(updatedState);
        },
      );
    } catch (e) {
      emit(state.copyWith(msg: e.toString()));
    }
  }

  Future<void> _onSelectTimeSlot(
    SelectTimeSlot event,
    Emitter<BookTimeSlotState> emit,
  ) async {
    await sl<CacheSelectedTimeSlotUseCase>().call(
      timeSlot: event.selectedTimeSlot,
    );
    await sl<CacheBookTimeSlotUseCase>().call(bookTimeSlot: event.bookTimeSlot);

    final updatedState = state.copyWith(isOpenBookSeatTypeScreen: true);
    emit(updatedState);
  }

  void _onOpenedBookSeatTypeScreen(
    OpenedBookSeatTypeScreen event,
    Emitter<BookTimeSlotState> emit,
  ) {
    final updatedState = state.copyWith(isOpenBookSeatTypeScreen: false);
    emit(updatedState);
  }

  // Filtering logic for BookTimeSlotEntity data
  // Filtering logic for local data
  static bool Function(BookingTimeSlotByCinemaResponse response) _filterFake(
    String keyword,
  ) {
    return (BookingTimeSlotByCinemaResponse response) =>
        keyword.isEmpty ||
        response.cine.name!.toLowerCase().contains(keyword.toLowerCase());
  }

  // Convert API response to a list of domain objects
  static List<BookTimeSlotEntity> _toBookTimeSlots(
    List<BookingTimeSlotByCinemaResponse> responses,
  ) {
    return responses
        .map(
          (response) => BookTimeSlotEntity(
            cine: response.cine.toEntity(),
            tami: response.tami,
            timeSlots: response.timeSlots.toEntities(),
          ),
        )
        .toList();
  }
}
