/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-17 23:26:52
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/ticket/ticket.dart';
import 'package:cinema_booking/data/sources/ticket/ticket_service.dart';
import 'package:cinema_booking/domain/repository/tickets/tickets.dart';
import 'package:cinema_booking/service_locator.dart';
import 'package:dartz/dartz.dart';

class AllTicketsRepositoryImpl extends AllTicketsRepository {
  @override
  Future<Either> createTicketData(Ticket ticket) async {
    return await sl<AllTicketsService>().createTicket(ticket);
  }

  @override
  Future<Either<String, List<Ticket>>> getAllTicketsData() async {
    return await sl<AllTicketsService>().getAllTicketsData();
  }
}
