/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:32:59
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:equatable/equatable.dart';

class SeatRowEntity extends Equatable {
  final String id;
  final String rowId;
  final String seatId;
  final int count;
  final List<int> offs;
  final List<int> booked;

  const SeatRowEntity({
    required this.id,
    required this.seatId,
    required this.rowId,
    required this.count,
    required this.offs,
    required this.booked,
  });

  @override
  List<Object> get props => [id, rowId, seatId, count, offs, booked];

  @override
  String toString() {
    return 'SeatRow{rowId: $rowId}';
  }
}
