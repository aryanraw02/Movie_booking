import 'package:cinema_booking/domain/entities/response/home.dart';

class ItemRecommendedMovieVM {
  late String photo;
  late String title;
  late int likePercent;
  MovieDetailEntity movie;

  ItemRecommendedMovieVM.fromMovie(this.movie) {
    photo = movie.detail.thumb;
    title = movie.detail.name;
    likePercent = movie.detail.rate;
  }
}
