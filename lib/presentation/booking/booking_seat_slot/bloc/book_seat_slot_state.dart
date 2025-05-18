/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-22 08:45:56
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/domain/entities/booking/booking_time_slot.dart';
import 'package:cinema_booking/domain/entities/movies/movies.dart';
import 'package:cinema_booking/domain/entities/show_time/time_slot.dart';
import 'package:cinema_booking/presentation/booking/booking_seat_slot/model/item_grid_seat_slot_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_seat_slot_state.freezed.dart';

@freezed
abstract class BookSeatSlotState with _$BookSeatSlotState {
  const factory BookSeatSlotState({
    MovieEntity? movie,
    TimeSlotEntity? selectedTimeSlot,
    BookTimeSlotEntity? bookTimeSlot,
    //
    @Default(false) bool isLoading,
    @Default([]) List<ItemGridSeatSlotVM> itemGridSeatSlotVMs,
    String? msg,
    //
    @Default(false) bool isSelectWrongSeatType,
    @Default(false) bool isReachedLimitSeatSlot,
    //
    @Default([]) List<String> selectedSeatIds,
    @Default(0) double totalPrice,
    //
    @Default(false) bool isOpenPaymentMethod,
  }) = _BookSeatSlotState;
}
