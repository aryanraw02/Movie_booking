/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-28
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

// ignore_for_file: unnecessary_null_comparison
import 'dart:convert';
import 'package:cinema_booking/core/local/pref.dart';
import 'package:cinema_booking/data/models/booking/booking_time_slot.dart';
import 'package:cinema_booking/data/models/movies/movies.dart';
import 'package:cinema_booking/data/models/show_time/time_slot.dart';
import 'package:cinema_booking/domain/entities/booking/booking_time_slot.dart';
import 'package:cinema_booking/domain/entities/movies/movies.dart';
import 'package:cinema_booking/domain/entities/show_time/time_slot.dart';
import 'package:dartz/dartz.dart';

abstract class MovieInfoService {
  Future<Either> cacheBookTimeSlot(BookTimeSlotEntity bookTimeSlot);
  Future<Either> cacheMovie(MovieEntity show);
  Future<Either> cacheSelectedTimeSlot(TimeSlotEntity timeSlot);
  Future<Either> getBookTimeSlot();
  Future<Either> getMovie();
  Future<Either> getSelectedTimeSlot();
}

class MovieInfoServiceImpl extends MovieInfoService {
  final LocalPref pref;

  MovieInfoServiceImpl({required this.pref});

  @override
  Future<Either<String, bool>> cacheBookTimeSlot(
    BookTimeSlotEntity bookTimeSlot,
  ) async {
    try {
      bool result = await pref.saveString(
        DATA_CONST.CACHE_BOOK_TIME_SLOT,
        json.encode(bookTimeSlot.toModel().toJson()),
      );
      return Right(result);
    } catch (e) {
      return Left('Error saving book time slot: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, bool>> cacheMovie(MovieEntity show) async {
    try {
      bool result = await pref.saveString(
        DATA_CONST.CACHE_SHOW,
        json.encode(show.toModel().toJson()),
      );
      return Right(result);
    } catch (e) {
      return Left('Error saving show: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, bool>> cacheSelectedTimeSlot(
    TimeSlotEntity timeSlot,
  ) async {
    try {
      bool result = await pref.saveString(
        DATA_CONST.CACHE_SELECTED_TIME_SLOT,
        json.encode(timeSlot.toModel().toJson()),
      );
      return Right(result);
    } catch (e) {
      return Left('Error saving selected time slot: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, BookTimeSlotEntity?>> getBookTimeSlot() async {
    try {
      String? jsonData = await pref.getString(DATA_CONST.CACHE_BOOK_TIME_SLOT);
      if (jsonData == null) return Right(null);

      BookTimeSlotEntity bookTimeSlot =
          BookTimeSlotModel.fromJson(json.decode(jsonData)).toEntity();
      return Right(bookTimeSlot);
    } catch (e) {
      return Left('Error retrieving book time slot: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, MovieEntity?>> getMovie() async {
    try {
      String? jsonData = await pref.getString(DATA_CONST.CACHE_SHOW);
      if (jsonData == null) return Right(null);

      MovieEntity show = MovieModel.fromJson(json.decode(jsonData)).toEntity();
      return Right(show);
    } catch (e) {
      return Left('Error retrieving show: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, TimeSlotEntity?>> getSelectedTimeSlot() async {
    try {
      String? jsonData = await pref.getString(
        DATA_CONST.CACHE_SELECTED_TIME_SLOT,
      );
      if (jsonData == null) return Right(null);

      TimeSlotEntity timeSlot =
          TimeSlotModel.fromJson(json.decode(jsonData)).toEntity();
      return Right(timeSlot);
    } catch (e) {
      return Left('Error retrieving selected time slot: ${e.toString()}');
    }
  }
}
