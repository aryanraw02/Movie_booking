// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket(
  (json['id'] as num).toInt(),
  json['movie_name'] as String,
  json['movie_banner'] as String,
  json['movie_time_slot'] as String,
  (json['book_time'] as num).toInt(),
  json['cine_name'] as String,
  json['seat'] as String,
);

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
  'id': instance.id,
  'movie_name': instance.movieName,
  'movie_banner': instance.movieBanner,
  'movie_time_slot': instance.movieTimeSlot,
  'book_time': instance.bookTime,
  'cine_name': instance.cineName,
  'seat': instance.seat,
};
