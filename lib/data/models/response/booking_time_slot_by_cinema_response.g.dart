// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_time_slot_by_cinema_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingTimeSlotByCinemaResponse _$BookingTimeSlotByCinemaResponseFromJson(
  Map<String, dynamic> json,
) => BookingTimeSlotByCinemaResponse(
  id: json['id'] as String,
  cine: CinemaModel.fromJson(json['cine'] as Map<String, dynamic>),
  tami: (json['tami'] as List<dynamic>).map((e) => e as String).toList(),
  timeSlots:
      (json['time_slots'] as List<dynamic>)
          .map((e) => TimeSlotModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$BookingTimeSlotByCinemaResponseToJson(
  BookingTimeSlotByCinemaResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'cine': instance.cine,
  'tami': instance.tami,
  'time_slots': instance.timeSlots,
};
