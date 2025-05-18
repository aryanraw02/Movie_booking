/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:31:49
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/cinema/cinema.dart';
import 'package:cinema_booking/data/models/genres/genres.dart';
import 'package:cinema_booking/data/models/movies/banner.dart';
import 'package:cinema_booking/data/models/movies/movies.dart';
import 'package:cinema_booking/data/models/response/movie_by_genres_response.dart';
import 'package:cinema_booking/data/models/response/movie_detail_response.dart';
import 'package:cinema_booking/domain/entities/cinema/cinema.dart';
import 'package:cinema_booking/domain/entities/genres/genres.dart';
import 'package:cinema_booking/domain/entities/movies/banner.dart';
import 'package:cinema_booking/domain/entities/movies/movies.dart';
import 'package:cinema_booking/domain/entities/response/home.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomeModelResponse {
  @JsonKey(name: "banners")
  final List<BannerModel>? banners;
  @JsonKey(name: "genres")
  final List<GenresModel>? genres;
  @JsonKey(name: "recommended_movies")
  final List<MovieDetailResponse>? recommendedMovies;
  @JsonKey(name: "nearby_cinemas")
  final List<CinemaModel>? nearbyCinemas;
  @JsonKey(name: "movie_by_genres")
  final List<MovieByGenresResponse>? movieByGenres;

  HomeModelResponse({
    this.banners,
    this.genres,
    this.recommendedMovies,
    this.nearbyCinemas,
    this.movieByGenres,
  });

  factory HomeModelResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeModelResponseToJson(this);
}

extension HomeResponseModelX on HomeModelResponse {
  HomeEntity toEntity() {
    return HomeEntity(
      banners:
          banners?.map((bannerModel) => bannerModel.toEntity()).toList() ?? [],
      genres:
          genres?.map((categoryModel) => categoryModel.toEntity()).toList() ??
          [],
      recommendedMovies:
          recommendedMovies
              ?.map((movieModel) => movieModel.toEntity())
              .toList() ??
          [],
      nearbyCinemas:
          nearbyCinemas?.map((cineModel) => cineModel.toEntity()).toList() ??
          [],
      movieByGenres:
          movieByGenres
              ?.map((movieByGenresResponse) => movieByGenresResponse.toEntity())
              .toList() ??
          [],
    );
  }

  List<GenresEntity> toGenresEntity() {
    return genres?.map((categoryModel) => categoryModel.toEntity()).toList() ??
        [];
  }

  List<BannerEntity> toBannersEntity() {
    return banners?.map((bannerModel) => bannerModel.toEntity()).toList() ?? [];
  }

  List<MovieEntity> toRecommendedMoviesEntity() {
    return recommendedMovies
            ?.map((recommendedMovie) => recommendedMovie.detail.toEntity())
            .toList() ??
        [];
  }

  List<CinemaEntity> toNearbyCinemasEntity() {
    return nearbyCinemas?.map((cineModel) => cineModel.toEntity()).toList() ??
        [];
  }
}
