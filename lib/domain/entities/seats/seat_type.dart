/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:32:59
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/core/enum/type_seat.dart';
import 'package:cinema_booking/domain/entities/seats/seat_row.dart';
import 'package:equatable/equatable.dart';

class SeatTypeEntity extends Equatable {
  final String id;
  final String name;
  final double price;
  final TypeSeat type;
  final List<SeatRowEntity>? seatRows;

  const SeatTypeEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.type,
    this.seatRows,
  });

  @override
  List<Object> get props => [id, name, price, type];
  @override
  String toString() {
    return 'SeatTypesModel{id: $id, name: $name, price: $price, type: $type, seatRows: ${seatRows?.map((row) => row.toString()).toList()}}';
  }
}
