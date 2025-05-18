// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) => BookingModel(
  id: json['id'] as String?,
  showTimeId: json['showtime_id'] as String?,
  userId: json['user_id'] as String?,
  seatRowId: json['seat_row_id'] as String?,
  seatNumber: json['seatNumber'] as String?,
  bookingTime: json['bookingTime'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'showtime_id': instance.showTimeId,
      'user_id': instance.userId,
      'seat_row_id': instance.seatRowId,
      'seatNumber': instance.seatNumber,
      'bookingTime': instance.bookingTime,
      'status': instance.status,
    };
