/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:30:45
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/domain/entities/booking/booking.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking.g.dart';

@JsonSerializable()
class BookingModel {
  String? id;
  @JsonKey(name: "showtime_id")
  String? showTimeId;
  @JsonKey(name: "user_id")
  String? userId;
  @JsonKey(name: "seat_row_id")
  String? seatRowId;
  String? seatNumber;
  String? bookingTime;
  String? status;

  BookingModel({
    this.id,
    this.showTimeId,
    this.userId,
    this.seatRowId,
    this.seatNumber,
    this.bookingTime,
    this.status,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingModelToJson(this);
}

extension BookingModelX on BookingModel {
  BookingEntity toEntity() {
    return BookingEntity(
      id: id ?? "",
      showTimeId: showTimeId ?? "",
      userId: userId ?? "",
      seatRowId: seatRowId ?? "",
      seatNumber: seatNumber ?? "",
      bookingTime: bookingTime ?? "",
      status: status ?? "",
    );
  }
}
