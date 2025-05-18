// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) =>
    MovieModel()
      ..id = json['id'] as String?
      ..name = json['name'] as String?
      ..thumb = json['thumb'] as String? ?? ''
      ..trailer = json['trailer'] as String? ?? ''
      ..releaseDate = (json['release_date'] as num?)?.toInt()
      ..rate = (json['rate'] as num?)?.toInt()
      ..votes = json['votes'] as String? ?? ''
      ..duration = (json['duration'] as num?)?.toInt()
      ..tags =
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumb': instance.thumb,
      'trailer': instance.trailer,
      'release_date': instance.releaseDate,
      'rate': instance.rate,
      'votes': instance.votes,
      'duration': instance.duration,
      'tags': instance.tags,
    };
