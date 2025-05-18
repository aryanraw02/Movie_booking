// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowTimeModel _$ShowTimeModelFromJson(Map<String, dynamic> json) =>
    ShowTimeModel(
      id: json['id'] as String?,
      cinemaId: json['cinema_id'] as String?,
      movieId: json['movie_id'] as String?,
      format: json['format'] as String?,
    );

Map<String, dynamic> _$ShowTimeModelToJson(ShowTimeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cinema_id': instance.cinemaId,
      'movie_id': instance.movieId,
      'format': instance.format,
    };
