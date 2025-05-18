/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-12
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/domain/entities/show_time/time_slot.dart';
import 'package:cinema_booking/domain/repository/booking_time/book_time_slot.dart';
import 'package:dartz/dartz.dart';
import 'package:cinema_booking/service_locator.dart';

class CacheSelectedTimeSlotUseCase {
  Future<Either<String, bool>> call({required TimeSlotEntity timeSlot}) async {
    return await sl<BookTimeSlotRepository>().cacheSelectedTimeSlot(timeSlot);
  }
}
