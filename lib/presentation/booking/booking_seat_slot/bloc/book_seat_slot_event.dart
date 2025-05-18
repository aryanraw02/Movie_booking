/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-22 08:45:56
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

part of 'book_seat_slot_bloc.dart';

abstract class BookSeatSlotEvent extends Equatable {
  const BookSeatSlotEvent();
}

class OpenScreen extends BookSeatSlotEvent {
  @override
  List<Object> get props => [];
}

class ClickSelectSeatSlot extends BookSeatSlotEvent {
  final ItemSeatSlotVM itemSeatSlotVM;

  const ClickSelectSeatSlot({required this.itemSeatSlotVM});

  @override
  List<Object> get props => [itemSeatSlotVM];
}

class DismissMessageWrongSeatType extends BookSeatSlotEvent {
  @override
  List<Object> get props => [];
}

class DismissMessageReachedLimitSeatSlot extends BookSeatSlotEvent {
  @override
  List<Object> get props => [];
}

class ClickButtonPay extends BookSeatSlotEvent {
  @override
  List<Object> get props => [DateTime.now().millisecond];
}

class OpenedPaymentMethodScreen extends BookSeatSlotEvent {
  @override
  List<Object> get props => [];
}
