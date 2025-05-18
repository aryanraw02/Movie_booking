/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-22 08:45:56
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/presentation/booking/booking_seat_slot/model/item_seat_slot_vm.dart';
import 'package:equatable/equatable.dart';

class ItemSeatRowVM extends Equatable {
  final String itemRowName;

  final List<ItemSeatSlotVM> seatSlotVMs;

  const ItemSeatRowVM({required this.itemRowName, required this.seatSlotVMs});

  @override
  List<Object> get props => [itemRowName, seatSlotVMs];
}
