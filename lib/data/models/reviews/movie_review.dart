/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:32:59
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/domain/entities/reviews/movie_review.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_review.g.dart';

@JsonSerializable()
class MovieReviewModel {
  String? id;
  @JsonKey(name: "movie_id")
  String? movieId;
  String? author;
  int? created;
  String? content;
  String? avatar;

  MovieReviewModel({
    this.id,
    this.movieId,
    this.author,
    this.created,
    this.content,
    this.avatar,
  });

  factory MovieReviewModel.fromJson(Map<String, dynamic> json) =>
      _$MovieReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieReviewModelToJson(this);

  @override
  String toString() {
    return 'MovieReview{author: $author, created: $created, content: $content, avatar: $avatar}';
  }
}

extension MovieReviewModelX on MovieReviewModel {
  MovieReviewEntity toEntity() {
    return MovieReviewEntity(
      id: id ?? "",
      movieId: movieId ?? "",
      author: author ?? "",
      created: created ?? 0,
      content: content ?? "",
      avatar: avatar ?? "",
    );
  }
}
