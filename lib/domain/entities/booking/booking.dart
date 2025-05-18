/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:30:45
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/booking/booking.dart';
import 'package:equatable/equatable.dart';

class BookingEntity extends Equatable {
  final String id;
  final String showTimeId;
  final String userId;
  final String seatRowId;
  final String seatNumber;
  final String bookingTime;
  final String status;

  const BookingEntity({
    required this.id,
    required this.showTimeId,
    required this.userId,
    required this.seatRowId,
    required this.seatNumber,
    required this.bookingTime,
    required this.status,
  });

  @override
  List<Object?> get props => [id, showTimeId, userId, seatRowId, status];
}

extension BookingEntityX on BookingEntity {
  BookingModel toModel() {
    return BookingModel(
      id: id,
      showTimeId: showTimeId,
      userId: userId,
      seatRowId: seatRowId,
      seatNumber: seatNumber,
      bookingTime: bookingTime,
      status: status,
    );
  }
}
