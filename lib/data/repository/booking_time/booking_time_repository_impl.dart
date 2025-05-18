/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-12
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/booking/booking_time_slot.dart';
import 'package:cinema_booking/data/models/movies/movies.dart';
import 'package:cinema_booking/data/models/response/booking_time_slot_by_cinema_response.dart';
import 'package:cinema_booking/data/models/show_time/time_slot.dart';
import 'package:cinema_booking/data/sources/booking_time/mock_book_time_slot_service.dart';
import 'package:cinema_booking/data/sources/booking_time/remote_booking_time_service.dart';
import 'package:cinema_booking/data/sources/booking_time/session_service.dart';
import 'package:cinema_booking/domain/entities/booking/booking_time_slot.dart';
import 'package:cinema_booking/domain/entities/movies/movies.dart';
import 'package:cinema_booking/domain/entities/show_time/time_slot.dart';
import 'package:cinema_booking/domain/repository/booking_time/book_time_slot.dart';
import 'package:cinema_booking/service_locator.dart';
import 'package:dartz/dartz.dart';

class BookTimeSlotRepositoryImpl extends BookTimeSlotRepository {
  @override
  Future<Either<String, List<BookingTimeSlotByCinemaResponse>>>
  getAllMoviesByType(String showId) async {
    final result = await sl<RemoteBookTimeSlotService>().getAllMoviesByType(
      showId,
    );
    return result;
  }

  @override
  Future<Either<String, bool>> cacheBookTimeSlot(
    BookTimeSlotEntity bookTimeSlot,
  ) async {
    return await sl<SessionService>().cacheBookTimeSlot(bookTimeSlot.toModel());
  }

  @override
  Future<Either<String, bool>> cacheSelectedTimeSlot(
    TimeSlotEntity timeSlot,
  ) async {
    return await sl<SessionService>().cacheSelectedTimeSlot(timeSlot.toModel());
  }

  @override
  Future<Either<String, bool>> cacheMovie(MovieEntity show) async {
    return await sl<SessionService>().cacheMovie(show.toModel());
  }

  @override
  Future<Either<String, BookTimeSlotEntity?>> getBookTimeSlot() async {
    final result = await sl<SessionService>().getBookTimeSlot();
    return result.map((model) => model?.toEntity());
  }

  @override
  Future<Either<String, TimeSlotEntity?>> getSelectedTimeSlot() async {
    final result = await sl<SessionService>().getSelectedTimeSlot();
    return result.map((model) => model?.toEntity());
  }

  @override
  Future<Either<String, MovieEntity?>> getMovie() async {
    final result = await sl<SessionService>().getMovie();

    return result.map((model) => model?.toEntity());
  }

  @override
  Future<Either> getMockAllMoviesByType(String showId) {
    return sl<MockBookTimeSlotService>().getAllMoviesByType(showId);
  }
}
