// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat_row.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeatRowModel _$SeatRowModelFromJson(Map<String, dynamic> json) => SeatRowModel(
  id: json['id'] as String?,
  rowId: json['row_id'] as String?,
  seatId: json['seat_id'] as String?,
  count: (json['count'] as num?)?.toInt(),
  offs:
      (json['offs'] as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
  booked:
      (json['booked'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
);

Map<String, dynamic> _$SeatRowModelToJson(SeatRowModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'row_id': instance.rowId,
      'seat_id': instance.seatId,
      'count': instance.count,
      'offs': instance.offs,
      'booked': instance.booked,
    };
