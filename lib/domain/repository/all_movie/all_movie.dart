/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-17 23:28:42
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:dartz/dartz.dart';

abstract class AllMoviesRepository {
  Future<Either> getAllMoviesData();
}
