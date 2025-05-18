/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:30:45
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/domain/entities/show_time/time_slot.dart';
import 'package:json_annotation/json_annotation.dart';

part 'time_slot.g.dart';

@JsonSerializable()
class TimeSlotModel {
  String? id;
  @JsonKey(name: "showtime_id")
  String? showtimeId;
  String? time;
  bool active;

  TimeSlotModel({this.id, this.showtimeId, this.time, this.active = false});

  factory TimeSlotModel.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotModelFromJson(json);

  Map<String, dynamic> toJson() => _$TimeSlotModelToJson(this);
}

extension TimeSlotModelMapper on TimeSlotModel {
  TimeSlotEntity toEntity() {
    return TimeSlotEntity(
      id: id ?? "",
      showtimeId: showtimeId ?? "",
      time: time ?? "",
      active: active,
    );
  }
}

extension TimeSlotModelListMapper on List<TimeSlotModel> {
  List<TimeSlotEntity> toEntities() {
    return map((model) => model.toEntity()).toList();
  }
}
