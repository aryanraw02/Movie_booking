// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModelResponse _$HomeModelResponseFromJson(
  Map<String, dynamic> json,
) => HomeModelResponse(
  banners:
      (json['banners'] as List<dynamic>?)
          ?.map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  genres:
      (json['genres'] as List<dynamic>?)
          ?.map((e) => GenresModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  recommendedMovies:
      (json['recommended_movies'] as List<dynamic>?)
          ?.map((e) => MovieDetailResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
  nearbyCinemas:
      (json['nearby_cinemas'] as List<dynamic>?)
          ?.map((e) => CinemaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  movieByGenres:
      (json['movie_by_genres'] as List<dynamic>?)
          ?.map(
            (e) => MovieByGenresResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
);

Map<String, dynamic> _$HomeModelResponseToJson(HomeModelResponse instance) =>
    <String, dynamic>{
      'banners': instance.banners,
      'genres': instance.genres,
      'recommended_movies': instance.recommendedMovies,
      'nearby_cinemas': instance.nearbyCinemas,
      'movie_by_genres': instance.movieByGenres,
    };
