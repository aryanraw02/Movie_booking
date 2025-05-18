/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 09:28:55
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/movies/movies.dart';
import 'package:cinema_booking/data/models/response/movie_detail_response.dart';
import 'package:cinema_booking/domain/entities/movies/movies.dart';
import 'package:cinema_booking/domain/entities/response/home.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_by_genres_response.g.dart';

@JsonSerializable()
class MovieByGenresResponse {
  @JsonKey(name: "genres_id")
  String? genresId;

  List<MovieDetailResponse>? movies;

  MovieByGenresResponse({this.genresId, this.movies});

  factory MovieByGenresResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieByGenresResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieByGenresResponseToJson(this);
}

extension MovieByGenresResponseX on MovieByGenresResponse {
  MovieByGenresEntity toEntity() {
    return MovieByGenresEntity(
      genresId: genresId ?? "",
      movies: movies!.map((movieModel) => movieModel.toEntity()).toList(),
    );
  }
}

extension MovieModelListX on List<MovieModel>? {
  List<MovieEntity> toMoviesEntity() {
    return this?.map((movie) => movie.toEntity()).toList() ?? [];
  }
}
