/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-22 08:45:56
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:cinema_booking/domain/entities/booking/booking_time_slot.dart';
import 'package:cinema_booking/presentation/booking/booking_seat_slot/book_seat_slot_screen.dart';
import 'package:cinema_booking/presentation/booking/booking_seat_type/bloc/book_seat_type_bloc.dart';
import 'package:cinema_booking/presentation/booking/booking_seat_type/bloc/book_seat_type_state.dart';
import 'package:cinema_booking/presentation/booking/booking_seat_type/widgets/widget_how_many_seats.dart';
import 'package:cinema_booking/presentation/booking/booking_time_slot/widgets/widget_cinema_timeslot.dart';
import 'package:cinema_booking/presentation/booking/booking_time_slot/widgets/widget_empty.dart';
import 'package:cinema_booking/presentation/booking/booking_time_slot/widgets/widget_toolbar.dart';
import 'package:cinema_booking/presentation/booking/model/item_time_slot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookSeatTypeScreen extends StatefulWidget {
  const BookSeatTypeScreen({super.key});

  @override
  State<BookSeatTypeScreen> createState() => _BookSeatTypeScreenState();
}

class _BookSeatTypeScreenState extends State<BookSeatTypeScreen> {
  late BuildContext _blocContext;

  late ItemCineTimeSlot _itemCineTimeSlot;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<BookSeatTypeBloc>(
        create: (context) => BookSeatTypeBloc()..add(OpenScreen()),
        child: BlocConsumer<BookSeatTypeBloc, BookSeatTypeState>(
          listener: (context, state) {
            if (state.isOpenBookSeatSlotScreen) {
              _openBookSeatSlotScreen(state);
            }
          },
          builder: (context, state) {
            _blocContext = context;

            if (state.movie != null && state.bookTimeSlot != null) {
              BookTimeSlotEntity bookTimeSlot = state.bookTimeSlot!;
              int selectedIndex = bookTimeSlot.timeSlots.indexOf(
                state.selectedTimeSlot!,
              );
              String movieName = state.movie!.name;

              _itemCineTimeSlot = ItemCineTimeSlot.fromBookTimeSlot(
                bookTimeSlot: bookTimeSlot,
              );

              return Scaffold(
                body: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        WidgetToolbar(title: movieName, actions: Container()),
                        Expanded(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                WidgetCineTimeSlot.selected(
                                  item: _itemCineTimeSlot,
                                  selectedIndex: selectedIndex,
                                  movieCineName: true,
                                  movieCineDot: false,
                                ),
                                WidgetSpacer(height: 14),
                                WidgetHowManySeats(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    _buildBtnSelectSeat(),
                  ],
                ),
              );
            }

            return WidgetEmpty();
          },
        ),
      ),
    );
  }

  _buildBtnSelectSeat() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: SizedBox(
        height: 54,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero, // Ensures full-width gradient
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Smooth rounded corners
            ),
          ),
          onPressed: () {
            BlocProvider.of<BookSeatTypeBloc>(
              _blocContext,
            ).add(ClickSelectSeats());
          },
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppColors.linearColor, // Gradient effect
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(minHeight: 54),
              child: Text(
                'SELECT SEATS',
                style: AppFont.semibold_white_18.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _openBookSeatSlotScreen(BookSeatTypeState state) {
    context.go(
      '/bookSeatSlot',
      extra: ScreenArguments(
        seatCount: state.seatCount,
        seatType: state.selectedSeatType,
      ),
    );

    BlocProvider.of<BookSeatTypeBloc>(
      _blocContext,
    ).add(OpenedBookSeatSlotScreen());
  }
}
