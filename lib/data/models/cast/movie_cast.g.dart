// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCastModel _$MovieCastModelFromJson(Map<String, dynamic> json) =>
    MovieCastModel(
      id: json['id'] as String?,
      movieId: json['movie_id'] as String?,
      name: json['name'] as String?,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$MovieCastModelToJson(MovieCastModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'movie_id': instance.movieId,
      'name': instance.name,
      'photo': instance.photo,
    };
