/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:29:42
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/domain/entities/movies/movies.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movies.g.dart';

// Manage showtime information.
@JsonSerializable()
class MovieModel {
  String? id;
  String? name;
  @JsonKey(defaultValue: "")
  String? thumb;
  @JsonKey(defaultValue: "")
  String? trailer;
  @JsonKey(name: "release_date")
  int? releaseDate;
  int? rate;
  @JsonKey(defaultValue: "")
  String? votes;
  int? duration;
  List<String>? tags;

  MovieModel();

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}

extension MovieModelX on MovieModel {
  MovieEntity toEntity() {
    return MovieEntity(
      id: id ?? "",
      name: name ?? "",
      thumb: thumb ?? "",
      trailer: trailer ?? "",
      releaseDate: releaseDate ?? 0,
      rate: rate ?? 0,
      votes: votes ?? "",
      duration: duration ?? 0,
      tags: tags ?? [],
    );
  }
}

extension MovieModelListX on List<MovieModel> {
  List<MovieEntity> toEntities() {
    return map((model) => model.toEntity()).toList();
  }
}
