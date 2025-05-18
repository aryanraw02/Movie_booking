/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:29:42
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/movies/movies.dart';
import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String id;
  final String name;
  final String thumb;
  final String trailer;
  final int releaseDate;
  final int rate;
  final String votes;
  final int duration;
  final List<String> tags;

  const MovieEntity({
    required this.id,
    required this.name,
    required this.thumb,
    required this.trailer,
    required this.releaseDate,
    required this.rate,
    required this.votes,
    required this.duration,
    required this.tags,
  });

  @override
  List<Object> get props => [
    id,
    name,
    thumb,
    trailer,
    releaseDate,
    rate,
    votes,
    duration,
  ];
}

extension MovieEntityX on MovieEntity {
  MovieModel toModel() {
    final showModel = MovieModel();
    showModel.id = id;
    showModel.name = name;
    showModel.thumb = thumb;
    showModel.trailer = trailer;
    showModel.releaseDate = releaseDate;
    showModel.rate = rate;
    showModel.votes = votes;
    showModel.duration = duration;
    showModel.tags = tags;
    return showModel;
  }
}
