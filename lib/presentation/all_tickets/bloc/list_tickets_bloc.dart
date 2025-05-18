/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-02-22 08:39:35
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'dart:async';

import 'package:cinema_booking/domain/usecase/tickets/get_all_tickets.dart';
import 'package:cinema_booking/presentation/all_tickets/bloc/list_tickets_state.dart';
import 'package:equatable/equatable.dart';
import 'package:cinema_booking/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'list_tickets_event.dart';

class ListTicketsBloc extends Bloc<ListTicketsEvent, ListTicketsState> {
  ListTicketsBloc() : super(ListTicketsState()) {
    on<OpenScreenListTicketsEvent>(_onOpenScreenListTicketsEvent);
  }

  Future<void> _onOpenScreenListTicketsEvent(
    OpenScreenListTicketsEvent event,
    Emitter<ListTicketsState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      final data = await sl<GetAllTicketsDataUseCase>().call();

      data.fold(
        (error) {
          emit(state.copyWith(isLoading: false, msg: error.toString()));
        },
        (data) {
          emit(
            state.copyWith(
              isLoading: false,
              data: data,
              msg: data.isEmpty ? "You have no ticket" : null,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, msg: e.toString()));
    }
  }
}
