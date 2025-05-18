/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:30:45
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/domain/entities/cast/movie_cast.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_cast.g.dart';

@JsonSerializable()
class MovieCastModel {
  String? id;
  @JsonKey(name: "movie_id")
  String? movieId;
  String? name;
  String? photo;

  MovieCastModel({this.id, this.movieId, this.name, this.photo});

  factory MovieCastModel.fromJson(Map<String, dynamic> json) =>
      _$MovieCastModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCastModelToJson(this);

  @override
  String toString() {
    return 'Cast{name: $name, photo: $photo}';
  }
}

extension MovieCastModelX on MovieCastModel {
  MovieCastEntity toEntity() {
    return MovieCastEntity(
      id: id ?? '',
      movieId: movieId ?? '',
      name: name ?? '',
      photo: photo ?? '',
    );
  }
}
