/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-02-22 08:39:35
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/ticket/ticket.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'list_tickets_state.freezed.dart';

@freezed
abstract class ListTicketsState with _$ListTicketsState {
  const factory ListTicketsState({
    @Default(true) bool isLoading,
    @Default([]) List<Ticket> data,
    String? msg,
  }) = _ListTicketsState;
}
