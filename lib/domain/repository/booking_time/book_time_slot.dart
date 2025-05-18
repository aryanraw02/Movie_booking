/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-17 23:28:42
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/response/booking_time_slot_by_cinema_response.dart';
import 'package:cinema_booking/domain/entities/booking/booking_time_slot.dart';
import 'package:cinema_booking/domain/entities/movies/movies.dart';
import 'package:cinema_booking/domain/entities/show_time/time_slot.dart';
import 'package:dartz/dartz.dart';

abstract class BookTimeSlotRepository {
  Future<Either<String, List<BookingTimeSlotByCinemaResponse>>>
  getAllMoviesByType(String showId);
  Future<Either<String, bool>> cacheBookTimeSlot(
    BookTimeSlotEntity bookTimeSlot,
  );
  Future<Either<String, bool>> cacheMovie(MovieEntity show);
  Future<Either<String, bool>> cacheSelectedTimeSlot(TimeSlotEntity timeSlot);
  Future<Either<String, BookTimeSlotEntity?>> getBookTimeSlot();
  Future<Either<String, MovieEntity?>> getMovie();
  Future<Either<String, TimeSlotEntity?>> getSelectedTimeSlot();
  Future<Either> getMockAllMoviesByType(String showId);
}
