/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:30:45
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/domain/entities/show_time/show_time.dart';
import 'package:json_annotation/json_annotation.dart';

part 'show_time.g.dart';

@JsonSerializable()
class ShowTimeModel {
  String? id;
  @JsonKey(name: "cinema_id")
  String? cinemaId;
  @JsonKey(name: "movie_id")
  String? movieId;
  String? format;

  ShowTimeModel({this.id, this.cinemaId, this.movieId, this.format});

  factory ShowTimeModel.fromJson(Map<String, dynamic> json) =>
      _$ShowTimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowTimeModelToJson(this);
}

extension ShowTimeModelMapper on ShowTimeModel {
  ShowTimeEntity toEntity() {
    return ShowTimeEntity(
      id: id ?? "",
      cinemaId: cinemaId ?? "",
      movieId: movieId ?? "",
      format: format ?? "",
    );
  }
}

extension ShowTimeModelListMapper on List<ShowTimeModel> {
  List<ShowTimeEntity> toEntities() {
    return map((model) => model.toEntity()).toList();
  }
}
