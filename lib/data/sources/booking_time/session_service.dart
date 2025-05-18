/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-12
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'dart:convert';

import 'package:cinema_booking/core/local/pref.dart';
import 'package:cinema_booking/data/models/booking/booking_time_slot.dart';
import 'package:cinema_booking/data/models/movies/movies.dart';
import 'package:cinema_booking/data/models/show_time/time_slot.dart';
import 'package:dartz/dartz.dart';

abstract class SessionService {
  Future<Either<String, bool>> cacheBookTimeSlot(
    BookTimeSlotModel bookTimeSlot,
  );
  Future<Either<String, bool>> cacheMovie(MovieModel show);
  Future<Either<String, bool>> cacheSelectedTimeSlot(TimeSlotModel timeSlot);
  Future<Either<String, BookTimeSlotModel?>> getBookTimeSlot();
  Future<Either<String, MovieModel?>> getMovie();
  Future<Either<String, TimeSlotModel?>> getSelectedTimeSlot();
}

class SessionServiceImpl extends SessionService {
  final Pref pref;

  SessionServiceImpl({required this.pref});

  @override
  Future<Either<String, bool>> cacheBookTimeSlot(
    BookTimeSlotModel bookTimeSlot,
  ) async {
    try {
      bool result = await pref.saveString(
        DATA_CONST.CACHE_BOOK_TIME_SLOT,
        json.encode(bookTimeSlot.toJson()),
      );
      return Right(result);
    } catch (e) {
      return Left('Error saving book time slot: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, bool>> cacheMovie(MovieModel show) async {
    try {
      bool result = await pref.saveString(
        DATA_CONST.CACHE_SHOW,
        json.encode(show.toJson()),
      );
      return Right(result);
    } catch (e) {
      return Left('Error saving show: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, bool>> cacheSelectedTimeSlot(
    TimeSlotModel timeSlot,
  ) async {
    try {
      bool result = await pref.saveString(
        DATA_CONST.CACHE_SELECTED_TIME_SLOT,
        json.encode(timeSlot.toJson()),
      );
      return Right(result);
    } catch (e) {
      return Left('Error saving selected time slot: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, BookTimeSlotModel?>> getBookTimeSlot() async {
    try {
      String? jsonData = await pref.getString(DATA_CONST.CACHE_BOOK_TIME_SLOT);

      BookTimeSlotModel bookTimeSlot = BookTimeSlotModel.fromJson(
        json.decode(jsonData),
      );
      return Right(bookTimeSlot);
    } catch (e) {
      return Left('Error retrieving book time slot: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, MovieModel?>> getMovie() async {
    try {
      String? jsonData = await pref.getString(DATA_CONST.CACHE_SHOW);
      MovieModel show = MovieModel.fromJson(json.decode(jsonData));

      return Right(show);
    } catch (e) {
      return Left('Error retrieving show: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, TimeSlotModel?>> getSelectedTimeSlot() async {
    try {
      String? jsonData = await pref.getString(
        DATA_CONST.CACHE_SELECTED_TIME_SLOT,
      );

      TimeSlotModel timeSlot = TimeSlotModel.fromJson(json.decode(jsonData));
      return Right(timeSlot);
    } catch (e) {
      return Left('Error retrieving selected time slot: ${e.toString()}');
    }
  }
}
