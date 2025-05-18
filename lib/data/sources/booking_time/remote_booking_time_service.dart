/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-12
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/core/api/rest_client.dart';
import 'package:cinema_booking/data/models/response/booking_time_slot_by_cinema_response.dart';
import 'package:cinema_booking/service_locator.dart';
import 'package:dartz/dartz.dart';

abstract class RemoteBookTimeSlotService {
  Future<Either<String, List<BookingTimeSlotByCinemaResponse>>>
  getAllMoviesByType(String showId);
}

class RemoteBookTimeSlotServiceImpl implements RemoteBookTimeSlotService {
  @override
  Future<Either<String, List<BookingTimeSlotByCinemaResponse>>>
  getAllMoviesByType(String showId) async {
    try {
      final client = RestClient(localDio);
      // Gọi API lấy dữ liệu
      final response = await client.getBookingTimeSlotByCine();

      // Xử lý ánh xạ từ JSON sang danh sách các model
      return Right(response);
    } catch (e) {
      return Left('Error fetching booking time slots: ${e.toString()}');
    }
  }
}
