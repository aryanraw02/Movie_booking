/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:30:45
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/show_time/time_slot.dart';
import 'package:equatable/equatable.dart';

class TimeSlotEntity extends Equatable {
  final String id;
  final String showtimeId;
  final String time;
  final bool active;

  int get hour => int.parse(time.split(":").first);

  const TimeSlotEntity({
    required this.id,
    required this.showtimeId,
    required this.time,
    required this.active,
  });

  @override
  List<Object?> get props => [id, showtimeId, time, active];
}

extension TimeSlotEntityMapper on TimeSlotEntity {
  TimeSlotModel toModel() {
    return TimeSlotModel(
      id: id,
      showtimeId: showtimeId,
      time: time,
      active: active,
    );
  }
}

extension TimeSlotEntityListMapper on List<TimeSlotEntity> {
  List<TimeSlotModel> toModels() {
    return map((model) => model.toModel()).toList();
  }
}
