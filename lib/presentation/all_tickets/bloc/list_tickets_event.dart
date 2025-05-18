/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-02-22 08:39:35
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

part of 'list_tickets_bloc.dart';

abstract class ListTicketsEvent extends Equatable {}

class OpenScreenListTicketsEvent extends ListTicketsEvent {
  @override
  List<Object> get props => [];
}
