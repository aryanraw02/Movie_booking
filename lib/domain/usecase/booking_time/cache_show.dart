/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-12
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/domain/entities/movies/movies.dart';
import 'package:cinema_booking/domain/repository/booking_time/book_time_slot.dart';
import 'package:dartz/dartz.dart';
import 'package:cinema_booking/service_locator.dart';

///
/// UseCase to cache a movie
///
class CacheMovieUseCase {
  Future<Either<String, bool>> call({required MovieEntity movie}) async {
    return await sl<BookTimeSlotRepository>().cacheMovie(movie);
  }
}
