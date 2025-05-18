/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-25 08:39:35
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/core/local/db_helper.dart';
import 'package:cinema_booking/data/models/ticket/ticket.dart';
import 'package:dartz/dartz.dart';

abstract class AllTicketsService {
  Future<Either<String, List<Ticket>>> getAllTicketsData();
  Future<Either> createTicket(Ticket ticket);
}

class AllTicketsServiceImpl extends AllTicketsService {
  @override
  Future<Either<String, List<Ticket>>> getAllTicketsData() async {
    try {
      var listMap = await DbHelper.db.query(
        DbHelper.TABLE_NAME,
        orderBy: '${DbHelper.COL_BOOK_TIME} DESC',
      );

      return right(listMap.map((jsonRaw) => Ticket.fromJson(jsonRaw)).toList());
    } catch (e) {
      return const Left(
        'An error occurred in getAllTicketsData, Please try again.',
      );
    }
  }

  @override
  Future<Either> createTicket(Ticket ticket) async {
    try {
      return right(DbHelper.db.insert(DbHelper.TABLE_NAME, ticket.toJson()));
    } catch (e) {
      return const Left('An error occurred in createTicket, Please try again.');
    }
  }
}
