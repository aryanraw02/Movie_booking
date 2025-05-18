import 'package:cinema_booking/domain/entities/cast/movie_cast.dart';

class ItemCast {
  late String name;
  late String photo;

  ItemCast(this.name, this.photo);

  ItemCast.fromCast(MovieCastEntity cast) {
    name = cast.name;
    photo = cast.photo;
  }
}
