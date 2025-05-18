/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-30 10:43:54
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/domain/repository/booking_time/book_time_slot.dart';
import 'package:dartz/dartz.dart';
import 'package:cinema_booking/service_locator.dart';

class MockBookTimeSlotUseCase {
  Future<Either> call({required String movieId}) async {
    return await sl<BookTimeSlotRepository>().getMockAllMoviesByType(movieId);
  }
}
