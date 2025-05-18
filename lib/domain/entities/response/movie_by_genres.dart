/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 09:28:55
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

part of 'home.dart';

class MovieByGenresEntity {
  final String genresId;
  final List<MovieDetailEntity> movies;

  MovieByGenresEntity({required this.genresId, required this.movies});
}
