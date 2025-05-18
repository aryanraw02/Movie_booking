/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-25 08:39:35
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/cinema/cinema.dart';
import 'package:cinema_booking/data/models/response/booking_time_slot_by_cinema_response.dart';
import 'package:dartz/dartz.dart';

abstract class MockBookTimeSlotService {
  Future<Either> getAllMoviesByType(String showId);
}

class MockBookTimeSlotServiceImpl extends MockBookTimeSlotService {
  @override
  Future<Either> getAllMoviesByType(String showId) async {
    return right(Future.value(getMockData()));
  }

  static List<BookingTimeSlotByCinemaResponse> getMockData() {
    final response1 = BookingTimeSlotByCinemaResponse(
      id: "1",
      cine: CinemaModel.mockData[0],
      timeSlots: [],
      tami: ['3D', '2D'],
    );

    final response2 = BookingTimeSlotByCinemaResponse(
      id: "2",
      cine: CinemaModel.mockData[1],
      timeSlots: [],
      tami: ['3D'],
    );

    final response3 = BookingTimeSlotByCinemaResponse(
      id: "3",
      cine: CinemaModel.mockData[2],
      timeSlots: [],
      tami: ['2D'],
    );

    return [response1, response2, response3];
  }
}
