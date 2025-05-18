// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_by_genres_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieByGenresResponse _$MovieByGenresResponseFromJson(
  Map<String, dynamic> json,
) => MovieByGenresResponse(
  genresId: json['genres_id'] as String?,
  movies:
      (json['movies'] as List<dynamic>?)
          ?.map((e) => MovieDetailResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$MovieByGenresResponseToJson(
  MovieByGenresResponse instance,
) => <String, dynamic>{
  'genres_id': instance.genresId,
  'movies': instance.movies,
};
