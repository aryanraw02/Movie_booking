/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-22 08:45:56
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/presentation/booking/booking_seat_slot/model/item_seat_row_vm.dart';
import 'package:equatable/equatable.dart';

class ItemGridSeatSlotVM extends Equatable {
  final int maxColumn;
  final String seatTypeName;

  final List<ItemSeatRowVM> seatRowVMs;

  const ItemGridSeatSlotVM({
    required this.maxColumn,
    required this.seatTypeName,
    required this.seatRowVMs,
  });

  @override
  List<Object> get props => [maxColumn, seatTypeName, seatRowVMs];
}
