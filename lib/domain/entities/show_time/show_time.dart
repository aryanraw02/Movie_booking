/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:30:45
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/show_time/show_time.dart';

import 'package:equatable/equatable.dart';

class ShowTimeEntity extends Equatable {
  final String id;
  final String cinemaId;
  final String movieId;
  final String format;

  const ShowTimeEntity({
    required this.id,
    required this.cinemaId,
    required this.movieId,
    required this.format,
  });

  @override
  List<Object?> get props => [id, cinemaId, movieId, format];
}

extension ShowTimeEntityMapper on ShowTimeEntity {
  ShowTimeModel toModel() {
    return ShowTimeModel(
      id: id,
      cinemaId: cinemaId,
      movieId: movieId,
      format: format,
    );
  }
}

extension ShowTimeEntityListMapper on List<ShowTimeEntity> {
  List<ShowTimeModel> toModels() {
    return map((model) => model.toModel()).toList();
  }
}
