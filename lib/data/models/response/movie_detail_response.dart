/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 09:28:55
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/cast/movie_cast.dart';
import 'package:cinema_booking/data/models/movies/movies.dart';
import 'package:cinema_booking/data/models/offer/movie_offer.dart';
import 'package:cinema_booking/data/models/reviews/movie_review.dart';
import 'package:cinema_booking/domain/entities/response/home.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_detail_response.g.dart';

@JsonSerializable()
class MovieDetailResponse {
  @JsonKey(name: "movie")
  MovieModel detail;
  @JsonKey(name: "tami")
  List<String>? format;
  @JsonKey(name: "tags")
  List<String>? genres;
  @JsonKey(name: "offers")
  List<MovieOfferModel>? movieOffer;
  @JsonKey(name: "total_reviews")
  int? totalReviews;
  @JsonKey(name: "latest_reviews")
  MovieReviewModel? latestReviews;
  @JsonKey(name: "casts")
  List<MovieCastModel>? casts;

  MovieDetailResponse({
    required this.detail,
    this.format,
    this.genres,
    this.movieOffer,
    this.totalReviews,
    this.latestReviews,
    this.casts,
  });

  factory MovieDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailResponseToJson(this);
}

extension MovieDetailResponseX on MovieDetailResponse {
  MovieDetailEntity toEntity() {
    return MovieDetailEntity(
      detail: detail.toEntity(),
      format: format ?? [],
      genres: genres ?? [],
      movieOffer: movieOffer?.map((offer) => offer.toEntity()).toList() ?? [],
      totalReviews: totalReviews ?? 0,
      latestReviews: latestReviews!.toEntity(),
      casts: casts?.map((cast) => cast.toEntity()).toList() ?? [],
    );
  }
}

extension MovieDetailResponseListX on List<MovieDetailResponse>? {
  List<MovieDetailEntity> toEntities() {
    return this?.map((response) => response.toEntity()).toList() ?? [];
  }
}
