/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-24 08:46:47
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/cinema/cinema.dart';
import 'package:cinema_booking/data/models/show_time/time_slot.dart';
import 'package:cinema_booking/domain/entities/booking/booking_time_slot.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking_time_slot.g.dart';

@JsonSerializable()
class BookTimeSlotModel {
  final CinemaModel cine;
  final List<TimeSlotModel> timeSlots;
  final List<String>? tami;

  BookTimeSlotModel({required this.cine, required this.timeSlots, this.tami});

  factory BookTimeSlotModel.fromJson(Map<String, dynamic> json) =>
      _$BookTimeSlotModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookTimeSlotModelToJson(this);
}

extension BookTimeSlotModelX on BookTimeSlotModel {
  BookTimeSlotEntity toEntity() {
    return BookTimeSlotEntity(
      cine: cine.toEntity(),
      timeSlots: timeSlots.map((slot) => slot.toEntity()).toList(),
      tami: tami,
    );
  }
}
