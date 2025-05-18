/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:30:45
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/domain/entities/seats/seat_row.dart';
import 'package:json_annotation/json_annotation.dart';

part 'seat_row.g.dart';

@JsonSerializable()
class SeatRowModel {
  String? id;
  @JsonKey(name: "row_id")
  String? rowId;
  @JsonKey(name: "seat_id")
  String? seatId;
  int? count;
  List<int>? offs = [];
  List<int>? booked = [];

  SeatRowModel({
    this.id,
    this.rowId,
    this.seatId,
    this.count,
    this.offs,
    this.booked,
  });

  static final List<SeatRowModel> sampleSeatSlotKing = [
    SeatRowModel(
      id: 'mock_data',
      seatId: 'mock_data',
      rowId: 'I',
      count: 11,
      offs: [4, 5],
      booked: [],
    ),
    SeatRowModel(
      id: 'mock_data',
      seatId: 'mock_data',
      rowId: 'J',
      count: 11,
      offs: [],
      booked: [],
    ),
  ];

  static final List<SeatRowModel> sampleSeatSlotQueen = [
    SeatRowModel(
      id: 'mock_data',
      seatId: 'mock_data',
      rowId: 'F',
      count: 11,
      offs: [4, 5],
      booked: [1, 2, 3],
    ),
    SeatRowModel(
      id: 'mock_data',
      seatId: 'mock_data',
      rowId: 'G',
      count: 11,
      offs: [4, 5],
      booked: [6, 7, 8],
    ),
    SeatRowModel(
      id: 'mock_data',
      seatId: 'mock_data',
      rowId: 'H',
      count: 11,
      offs: [],
      booked: [0, 1, 4, 5, 9, 10],
    ),
  ];

  static final List<SeatRowModel> sampleSeatSlotJack = [
    SeatRowModel(
      id: 'mock_data',
      seatId: 'mock_data',
      rowId: 'A',
      count: 11,
      offs: [4, 5],
      booked: [0, 1, 2, 3],
    ),
    SeatRowModel(
      id: 'mock_data',
      seatId: 'mock_data',
      rowId: 'B',
      count: 11,
      offs: [4, 5],
      booked: [1, 2, 6, 7],
    ),
    SeatRowModel(
      id: 'mock_data',
      seatId: 'mock_data',
      rowId: 'C',
      count: 11,
      offs: [4, 5],
      booked: [9, 10],
    ),
    SeatRowModel(
      id: 'mock_data',
      seatId: 'mock_data',
      rowId: 'D',
      count: 11,
      offs: [4, 5],
      booked: [9, 10],
    ),
    SeatRowModel(
      id: 'mock_data',
      seatId: 'mock_data',
      rowId: 'E',
      count: 11,
      offs: [],
      booked: [2, 3, 4, 5, 6, 7],
    ),
  ];

  factory SeatRowModel.fromJson(Map<String, dynamic> json) =>
      _$SeatRowModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeatRowModelToJson(this);

  @override
  String toString() {
    return 'SeatRow{rowId: $rowId}';
  }
}

extension SeatRowModelMapper on SeatRowModel {
  SeatRowEntity toEntity() {
    return SeatRowEntity(
      rowId: rowId ?? "",
      count: count ?? 0,
      offs: offs != null ? List<int>.from(offs!) : [],
      booked: booked != null ? List<int>.from(booked!) : [],
      id: id ?? "",
      seatId: seatId ?? "",
    );
  }
}

extension SeatRowModelListMapper on List<SeatRowModel> {
  List<SeatRowEntity> toEntities() {
    return map((model) => model.toEntity()).toList();
  }
}
