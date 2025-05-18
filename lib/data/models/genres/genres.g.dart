// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenresModel _$GenresModelFromJson(Map<String, dynamic> json) => GenresModel(
  id: json['id'] as String?,
  name: json['name'] as String?,
  listMovie:
      (json['list_movie'] as List<dynamic>?)?.map((e) => e as String).toList(),
  icon: json['icon'] as String?,
);

Map<String, dynamic> _$GenresModelToJson(GenresModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'list_movie': instance.listMovie,
      'icon': instance.icon,
    };
