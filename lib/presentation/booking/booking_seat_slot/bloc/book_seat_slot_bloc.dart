/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-22 08:45:56
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'dart:collection';
import 'package:cinema_booking/common/helpers/log_helpers.dart';
import 'package:cinema_booking/core/enum/type_seat.dart';
import 'package:cinema_booking/data/models/seats/seat_type.dart';
import 'package:cinema_booking/data/models/ticket/ticket.dart';
import 'package:cinema_booking/domain/entities/booking/booking_time_slot.dart';
import 'package:cinema_booking/domain/entities/movies/movies.dart';
import 'package:cinema_booking/domain/entities/seats/seat_row.dart';
import 'package:cinema_booking/domain/entities/seats/seat_type.dart';
import 'package:cinema_booking/domain/entities/show_time/time_slot.dart';
import 'package:cinema_booking/domain/repository/seat_slot/seat_slot_repository.dart';
import 'package:cinema_booking/domain/usecase/booking_time/get_cached_book_time_slot.dart';
import 'package:cinema_booking/domain/usecase/booking_time/get_cached_selected_time_slot.dart';
import 'package:cinema_booking/domain/usecase/booking_time/get_cached_show.dart';
import 'package:cinema_booking/domain/usecase/tickets/create_ticket.dart';
import 'package:cinema_booking/presentation/booking/booking_seat_slot/bloc/book_seat_slot_state.dart';
import 'package:cinema_booking/presentation/booking/booking_seat_slot/model/item_grid_seat_slot_vm.dart';
import 'package:cinema_booking/presentation/booking/booking_seat_slot/model/item_seat_row_vm.dart';
import 'package:cinema_booking/presentation/booking/booking_seat_slot/model/item_seat_slot_vm.dart';
import 'package:cinema_booking/service_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_seat_slot_event.dart';

class BookSeatSlotBloc extends Bloc<BookSeatSlotEvent, BookSeatSlotState> {
  final int seatCount;
  final TypeSeat selectedSeatType;

  HashMap<String, bool> selectedSeats = HashMap();
  List<SeatTypeEntity> seatSlotByTypes = [];

  BookSeatSlotBloc({required this.seatCount, required this.selectedSeatType})
    : super(const BookSeatSlotState(isLoading: true)) {
    on<OpenScreen>(_onOpenScreen);
    on<ClickSelectSeatSlot>(_onClickSelectSeatSlot);
    on<DismissMessageWrongSeatType>(_onDismissMessageWrongSeatType);
    on<DismissMessageReachedLimitSeatSlot>(
      _onDismissMessageReachedLimitSeatSlot,
    );
    on<ClickButtonPay>(_onClickButtonPay);
    on<OpenedPaymentMethodScreen>(_onOpenedPaymentMethodScreen);
  }

  Future<void> _onOpenScreen(
    OpenScreen event,
    Emitter<BookSeatSlotState> emit,
  ) async {
    MovieEntity? movie;
    TimeSlotEntity? selectedTimeSlot;
    BookTimeSlotEntity? bookTimeSlot;

    final movieData = await sl<GetCachedMovieUseCase>().call();
    final selectedTimeSlotData =
        await sl<GetCachedSelectedTimeSlotUseCase>().call();
    final bookTimeSlotData = await sl<GetCachedBookTimeSlotUseCase>().call();

    movieData.fold(
      (error) {
        LogHelper.error(
          tag: 'OpenScreen Error',
          message: "BookSeatSlotBloc movieData $error",
        );
      },
      (data) {
        movie = data;
      },
    );
    selectedTimeSlotData.fold(
      (error) {
        LogHelper.error(
          tag: 'OpenScreen Error',
          message: "BookSeatSlotBloc selectedTimeSlotData $error",
        );
      },
      (data) {
        selectedTimeSlot = data;
      },
    );
    bookTimeSlotData.fold(
      (error) {
        LogHelper.error(
          tag: 'OpenScreen Error',
          message: "BookSeatSlotBloc bookTimeSlotData $error",
        );
      },
      (data) {
        bookTimeSlot = data;
      },
    );
    try {
      List<SeatTypesModel> seatSlotModelByTypes =
          await sl<SeatSlotRepository>().getListSeatSlotBySeatTypes();

      seatSlotByTypes = seatSlotModelByTypes.toEntities();

      emit(
        state.copyWith(
          isLoading: false,
          movie: movie,
          selectedTimeSlot: selectedTimeSlot,
          bookTimeSlot: bookTimeSlot,
          itemGridSeatSlotVMs: toItemGridSeatSlotVMs(seatSlotByTypes),
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, msg: e.toString()));
    }
  }

  Future<void> _onClickSelectSeatSlot(
    ClickSelectSeatSlot event,
    Emitter<BookSeatSlotState> emit,
  ) async {
    final item = event.itemSeatSlotVM;

    if (item.seatType == selectedSeatType) {
      if (!selectedSeats.containsKey(item.seatId)) {
        if (!isReachedLimitSlot()) {
          selectedSeats[item.seatId] = true;

          emit(
            state.copyWith(
              itemGridSeatSlotVMs: toItemGridSeatSlotVMs(seatSlotByTypes),
              selectedSeatIds: getSelectedSeatSlotId(),
              totalPrice: calculateTotalPrice(),
            ),
          );
        } else {
          emit(state.copyWith(isReachedLimitSeatSlot: true));
        }
      } else {
        final isSelected = !selectedSeats[item.seatId]!;
        if ((isSelected && !isReachedLimitSlot()) || !isSelected) {
          selectedSeats[item.seatId] = isSelected;

          emit(
            state.copyWith(
              itemGridSeatSlotVMs: toItemGridSeatSlotVMs(seatSlotByTypes),
              selectedSeatIds: getSelectedSeatSlotId(),
              totalPrice: calculateTotalPrice(),
            ),
          );
        } else {
          emit(state.copyWith(isReachedLimitSeatSlot: true));
        }
      }
    } else {
      emit(state.copyWith(isSelectWrongSeatType: true));
    }
  }

  void _onDismissMessageWrongSeatType(
    DismissMessageWrongSeatType event,
    Emitter<BookSeatSlotState> emit,
  ) {
    emit(state.copyWith(isSelectWrongSeatType: false));
  }

  void _onDismissMessageReachedLimitSeatSlot(
    DismissMessageReachedLimitSeatSlot event,
    Emitter<BookSeatSlotState> emit,
  ) {
    emit(state.copyWith(isReachedLimitSeatSlot: false));
  }

  void _onClickButtonPay(
    ClickButtonPay event,
    Emitter<BookSeatSlotState> emit,
  ) {
    final ticket = Ticket(
      DateTime.now().millisecondsSinceEpoch,
      state.movie!.name,
      state.movie!.thumb,
      state.selectedTimeSlot!.time,
      DateTime.now().millisecondsSinceEpoch,
      state.bookTimeSlot!.cine.name,
      state.selectedSeatIds.join(";"),
    );

    sl<CreateTicketUseCase>().call(params: ticket);
    emit(state.copyWith(isOpenPaymentMethod: true));
  }

  void _onOpenedPaymentMethodScreen(
    OpenedPaymentMethodScreen event,
    Emitter<BookSeatSlotState> emit,
  ) {
    emit(state.copyWith(isOpenPaymentMethod: false));
  }

  bool isReachedLimitSlot() {
    final isReached = getSelectedSeatSlotId().length == seatCount;

    return isReached;
  }

  List<String> getSelectedSeatSlotId() {
    final selectedIds =
        selectedSeats.keys.where((key) => selectedSeats[key]!).toList();

    return selectedIds;
  }

  double calculateTotalPrice() {
    final totalPrice =
        SeatTypesModel.mockData
            .firstWhere((type) => type.type == selectedSeatType)
            .price! *
        getSelectedSeatSlotId().length;
    LogHelper.info(
      tag: 'BookSeatSlotBloc',
      message: 'Total price calculated: $totalPrice',
    );
    return totalPrice;
  }

  List<ItemGridSeatSlotVM> toItemGridSeatSlotVMs(
    List<SeatTypeEntity> seatSlotByTypes,
  ) {
    return seatSlotByTypes.map((seatSlotType) {
      final seatTypeName =
          '\$ ${seatSlotType.price} ${seatSlotType.type.toText().toUpperCase()}';
      final maxColumn = seatSlotType.seatRows![0].count + 1;

      LogHelper.info(
        tag: 'BookSeatSlotBloc',
        message:
            'Invalid seatTypeName: $seatTypeName ; SeatTypeModel: $seatSlotType',
      );

      return ItemGridSeatSlotVM(
        seatTypeName: seatTypeName,
        maxColumn: maxColumn,
        seatRowVMs: _toItemSeatRowVMs(seatSlotType.seatRows, seatSlotType.type),
      );
    }).toList();
  }

  List<ItemSeatRowVM> _toItemSeatRowVMs(
    List<SeatRowEntity>? seatRows,
    TypeSeat seatType,
  ) {
    return seatRows!.map((seatRow) {
      final itemRowName = seatRow.rowId;
      return ItemSeatRowVM(
        itemRowName: itemRowName,
        seatSlotVMs: _toItemSeatSlotVMs(seatRow, seatRow.count, seatType),
      );
    }).toList();
  }

  List<ItemSeatSlotVM> _toItemSeatSlotVMs(
    SeatRowEntity seatRow,
    int count,
    TypeSeat seatType,
  ) {
    return Iterable<int>.generate(count).map((i) {
      final seatId = "${seatRow.rowId}$i";
      final isOff = seatRow.offs.contains(i);
      final isBooked = seatRow.booked.contains(i);
      final isSelected = selectedSeats[seatId] ?? false;

      return ItemSeatSlotVM(
        seatId: seatId,
        isBooked: isBooked,
        isOff: isOff,
        isSelected: isSelected,
        seatType: seatType,
      );
    }).toList();
  }
}
