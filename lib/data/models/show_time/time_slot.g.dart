// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSlotModel _$TimeSlotModelFromJson(Map<String, dynamic> json) =>
    TimeSlotModel(
      id: json['id'] as String?,
      showtimeId: json['showtime_id'] as String?,
      time: json['time'] as String?,
      active: json['active'] as bool? ?? false,
    );

Map<String, dynamic> _$TimeSlotModelToJson(TimeSlotModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'showtime_id': instance.showtimeId,
      'time': instance.time,
      'active': instance.active,
    };
