// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_movie_by_type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllMoviesModelResponse _$AllMoviesModelResponseFromJson(
  Map<String, dynamic> json,
) => AllMoviesModelResponse(
  (json['now_showing'] as List<dynamic>)
      .map((e) => MovieDetailResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  (json['coming_soon'] as List<dynamic>)
      .map((e) => MovieDetailResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  (json['exclusive'] as List<dynamic>)
      .map((e) => MovieDetailResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AllMoviesModelResponseToJson(
  AllMoviesModelResponse instance,
) => <String, dynamic>{
  'now_showing': instance.nowMovieing,
  'coming_soon': instance.comingSoon,
  'exclusive': instance.exclusive,
};
