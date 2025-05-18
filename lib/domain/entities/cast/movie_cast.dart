/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:30:45
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/cast/movie_cast.dart';
import 'package:equatable/equatable.dart';

class MovieCastEntity extends Equatable {
  final String id;
  final String movieId;
  final String name;
  final String photo;

  const MovieCastEntity({
    required this.id,
    required this.movieId,
    required this.name,
    required this.photo,
  });

  @override
  String toString() {
    return 'Cast{name: $name, photo: $photo}';
  }

  @override
  List<Object?> get props => [id, movieId, name, photo];
}

extension MovieCastEntityX on MovieCastEntity {
  MovieCastModel toModel() {
    return MovieCastModel(id: id, movieId: id, name: name, photo: photo);
  }
}
