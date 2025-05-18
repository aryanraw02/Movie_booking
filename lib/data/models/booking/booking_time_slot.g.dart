// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_time_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookTimeSlotModel _$BookTimeSlotModelFromJson(Map<String, dynamic> json) =>
    BookTimeSlotModel(
      cine: CinemaModel.fromJson(json['cine'] as Map<String, dynamic>),
      timeSlots:
          (json['timeSlots'] as List<dynamic>)
              .map((e) => TimeSlotModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      tami: (json['tami'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BookTimeSlotModelToJson(BookTimeSlotModel instance) =>
    <String, dynamic>{
      'cine': instance.cine,
      'timeSlots': instance.timeSlots,
      'tami': instance.tami,
    };
