import 'package:cinema_booking/core/configs/assets/app_vectors.dart';
import 'package:cinema_booking/domain/entities/genres/genres.dart';

class ItemGenresVM {
  GenresEntity genres;
  late String image;
  late String title;

  ItemGenresVM.fromGenres(this.genres) {
    image = AppVectors.basePath + genres.icon.toString();
    title = genres.name;
  }
}
