/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:32:59
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/reviews/movie_review.dart';
import 'package:equatable/equatable.dart';

class MovieReviewEntity extends Equatable {
  final String id;
  final String movieId;
  final String author;
  final int created;
  final String content;
  final String avatar;

  const MovieReviewEntity({
    required this.id,
    required this.movieId,
    required this.author,
    required this.created,
    required this.content,
    required this.avatar,
  });

  @override
  List<Object> get props => [id, movieId, author, created, content, avatar];

  @override
  String toString() {
    return 'MovieReview{author: $author, created: $created, content: $content, avatar: $avatar}';
  }
}

extension MovieReviewEntityX on MovieReviewEntity {
  MovieReviewModel toModel() {
    return MovieReviewModel(
      id: id,
      movieId: movieId,
      author: author,
      created: created,
      content: content,
      avatar: avatar,
    );
  }
}
