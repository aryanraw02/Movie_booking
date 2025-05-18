/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-01-17 23:28:42
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/ticket/ticket.dart';
import 'package:dartz/dartz.dart';

abstract class AllTicketsRepository {
  Future<Either<String, List<Ticket>>> getAllTicketsData();
  Future<Either> createTicketData(Ticket ticket);
}
