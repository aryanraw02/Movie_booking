// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailResponse _$MovieDetailResponseFromJson(
  Map<String, dynamic> json,
) => MovieDetailResponse(
  detail: MovieModel.fromJson(json['movie'] as Map<String, dynamic>),
  format: (json['tami'] as List<dynamic>?)?.map((e) => e as String).toList(),
  genres: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  movieOffer:
      (json['offers'] as List<dynamic>?)
          ?.map((e) => MovieOfferModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalReviews: (json['total_reviews'] as num?)?.toInt(),
  latestReviews:
      json['latest_reviews'] == null
          ? null
          : MovieReviewModel.fromJson(
            json['latest_reviews'] as Map<String, dynamic>,
          ),
  casts:
      (json['casts'] as List<dynamic>?)
          ?.map((e) => MovieCastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$MovieDetailResponseToJson(
  MovieDetailResponse instance,
) => <String, dynamic>{
  'movie': instance.detail,
  'tami': instance.format,
  'tags': instance.genres,
  'offers': instance.movieOffer,
  'total_reviews': instance.totalReviews,
  'latest_reviews': instance.latestReviews,
  'casts': instance.casts,
};
