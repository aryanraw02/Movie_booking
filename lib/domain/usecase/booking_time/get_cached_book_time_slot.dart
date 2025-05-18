/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-12
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/domain/entities/booking/booking_time_slot.dart';
import 'package:cinema_booking/domain/repository/booking_time/book_time_slot.dart';
import 'package:dartz/dartz.dart';
import 'package:cinema_booking/service_locator.dart';

///
/// UseCase to get a cached book time slot
///
class GetCachedBookTimeSlotUseCase {
  Future<Either<String, BookTimeSlotEntity?>> call() async {
    return await sl<BookTimeSlotRepository>().getBookTimeSlot();
  }
}
