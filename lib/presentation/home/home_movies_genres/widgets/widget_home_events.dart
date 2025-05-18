/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/core/configs/assets/app_vectors.dart';
import 'package:cinema_booking/domain/entities/genres/genres.dart';
import 'package:cinema_booking/domain/entities/response/home.dart';
import 'package:cinema_booking/presentation/home/widgets/widget_home_poster.dart';
import 'package:flutter/material.dart';

class WidgetHomeEvents extends StatelessWidget {
  final GenresEntity genres;
  final List<MovieDetailEntity> movies;

  const WidgetHomeEvents({
    super.key,
    required this.genres,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return WidgetHomePosters(
      items: movies.map((movie) => ItemPosterVM.fromMovie(movie)).toList(),
      label: genres.name,
      iconPath: AppVectors.basePath + genres.icon.toString(),
    );
  }
}
