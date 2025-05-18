/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:30:45
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/booking/booking_time_slot.dart';
import 'package:cinema_booking/domain/entities/cinema/cinema.dart';
import 'package:cinema_booking/domain/entities/show_time/time_slot.dart';

class BookTimeSlotEntity {
  final CinemaEntity cine;
  final List<TimeSlotEntity> timeSlots;
  final List<String>? tami;

  BookTimeSlotEntity({required this.cine, required this.timeSlots, this.tami});
}

extension BookTimeSlotEntityX on BookTimeSlotEntity {
  BookTimeSlotModel toModel() {
    return BookTimeSlotModel(
      cine: cine.toModel(),
      timeSlots: timeSlots.map((slot) => slot.toModel()).toList(),
      tami: tami,
    );
  }
}
