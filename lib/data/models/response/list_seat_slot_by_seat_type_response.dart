/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-24 08:46:47
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/seats/seat_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_seat_slot_by_seat_type_response.g.dart';

@JsonSerializable()
class ListSeatModelResponse {
  List<SeatTypesModel> data;

  ListSeatModelResponse(this.data);

  factory ListSeatModelResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSeatModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListSeatModelResponseToJson(this);
}
