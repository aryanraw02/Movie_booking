/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-02-18 08:46:47
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'ticket.g.dart';

@JsonSerializable()
class Ticket extends Equatable {
  final int id;

  @JsonKey(name: "movie_name")
  final String movieName;

  @JsonKey(name: "movie_banner")
  final String movieBanner;

  @JsonKey(name: "movie_time_slot")
  final String movieTimeSlot;

  @JsonKey(name: "book_time")
  final int bookTime;

  @JsonKey(name: "cine_name")
  final String cineName;

  final String seat;

  const Ticket(
    this.id,
    this.movieName,
    this.movieBanner,
    this.movieTimeSlot,
    this.bookTime,
    this.cineName,
    this.seat,
  );

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  Map<String, dynamic> toJson() => _$TicketToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return 'Ticket{id: $id, movieName: $movieName, seat: $seat}';
  }
}
