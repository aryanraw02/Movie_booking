/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-12
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/response/booking_time_slot_by_cinema_response.dart';
import 'package:cinema_booking/domain/repository/booking_time/book_time_slot.dart';
import 'package:dartz/dartz.dart';
import 'package:cinema_booking/service_locator.dart';

///
/// UseCase to fetch all movies by type
///
class GetAllMoviesByTypeUseCase {
  Future<Either<String, List<BookingTimeSlotByCinemaResponse>>> call({
    required String movieId,
  }) async {
    return await sl<BookTimeSlotRepository>().getAllMoviesByType(movieId);
  }
}
