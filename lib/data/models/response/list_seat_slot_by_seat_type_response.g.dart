// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_seat_slot_by_seat_type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListSeatModelResponse _$ListSeatModelResponseFromJson(
  Map<String, dynamic> json,
) => ListSeatModelResponse(
  (json['data'] as List<dynamic>)
      .map((e) => SeatTypesModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ListSeatModelResponseToJson(
  ListSeatModelResponse instance,
) => <String, dynamic>{'data': instance.data};
