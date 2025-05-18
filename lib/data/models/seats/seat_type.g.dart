// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeatTypesModel _$SeatTypesModelFromJson(Map<String, dynamic> json) =>
    SeatTypesModel(
      json['name'] as String? ?? '',
      _$JsonConverterFromJson<Object, double>(
        json['price'],
        const StringAsDoubleConverter().fromJson,
      ),
      $enumDecodeNullable(_$TypeSeatEnumMap, json['seat_type']) ??
          TypeSeat.jack,
      (json['seat_rows'] as List<dynamic>)
          .map((e) => SeatRowModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..id = json['id'] as String?;

Map<String, dynamic> _$SeatTypesModelToJson(SeatTypesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': _$JsonConverterToJson<Object, double>(
        instance.price,
        const StringAsDoubleConverter().toJson,
      ),
      'seat_type': _$TypeSeatEnumMap[instance.type]!,
      'seat_rows': instance.seatRows,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

const _$TypeSeatEnumMap = {
  TypeSeat.king: 'king',
  TypeSeat.queen: 'queen',
  TypeSeat.jack: 'jack',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
