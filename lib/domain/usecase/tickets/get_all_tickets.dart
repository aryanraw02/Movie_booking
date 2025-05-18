/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-15 10:16:59
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/ticket/ticket.dart';
import 'package:cinema_booking/domain/repository/tickets/tickets.dart';
import 'package:dartz/dartz.dart';
import 'package:cinema_booking/core/usecase/usecase.dart';
import 'package:cinema_booking/service_locator.dart';

///
/// show all ticket have buy
///
class GetAllTicketsDataUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either<String, List<Ticket>>> call({params}) async {
    return await sl<AllTicketsRepository>().getAllTicketsData();
  }
}
