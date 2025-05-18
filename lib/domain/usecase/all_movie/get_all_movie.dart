/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-10-15 10:16:59
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/domain/repository/all_movie/all_movie.dart';
import 'package:dartz/dartz.dart';
import 'package:cinema_booking/core/usecase/usecase.dart';
import 'package:cinema_booking/service_locator.dart';

///
/// Get All Movie on Search
///
class GetAllMoviesDataUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<AllMoviesRepository>().getAllMoviesData();
  }
}
