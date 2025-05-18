/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-22 08:45:56
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/domain/entities/booking/booking_time_slot.dart';
import 'package:cinema_booking/domain/entities/movies/movies.dart';
import 'package:cinema_booking/presentation/booking/booking_time_slot/bloc/book_time_slot_bloc.dart';
import 'package:cinema_booking/presentation/booking/booking_time_slot/bloc/book_time_slot_state.dart';
import 'package:cinema_booking/presentation/booking/booking_time_slot/widgets/widget_cinema_pick_date.dart';
import 'package:cinema_booking/presentation/booking/booking_time_slot/widgets/widget_cinema_timeslot.dart';
import 'package:cinema_booking/presentation/booking/booking_time_slot/widgets/widget_loading.dart';
import 'package:cinema_booking/presentation/booking/booking_time_slot/widgets/widget_screen_message.dart';
import 'package:cinema_booking/presentation/booking/booking_time_slot/widgets/widget_search_sort_toolbar.dart';
import 'package:cinema_booking/presentation/booking/booking_time_slot/widgets/widget_unknown_state.dart';
import 'package:cinema_booking/presentation/booking/model/item_time_slot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookTimeSlotScreen extends StatelessWidget {
  final MovieEntity movie;

  const BookTimeSlotScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<BookTimeSlotBloc>(
          create: (context) => BookTimeSlotBloc()..add(OpenScreen()),
          child: Column(
            children: <Widget>[
              WidgetSearchSortToolbar(title: movie.name),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    _buildListCineTimeSlot(),
                    _buildBtnToday(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildListCineTimeSlot() {
    return BlocConsumer<BookTimeSlotBloc, BookTimeSlotState>(
      listener: (context, state) {
        if (state.isOpenBookSeatTypeScreen) {
          _openBookSeatTypeScreen(context);
        }
      },
      builder: (context, state) {
        if (state.list.isNotEmpty) {
          return ListView.separated(
            itemBuilder: (context, index) {
              if (index < state.list.length) {
                BookTimeSlotEntity bookTimeSlot = state.list[index];

                ItemCineTimeSlot item = ItemCineTimeSlot.fromBookTimeSlot(
                  bookTimeSlot: bookTimeSlot,
                );

                return WidgetCineTimeSlot(item);
              } else {
                return WidgetSpacer(height: 55);
              }
            },
            separatorBuilder: (context, index) {
              return WidgetSpacer(height: 14);
            },
            itemCount: state.list.length + 1,
            physics: BouncingScrollPhysics(),
          );
        }

        if (state.isLoading) {
          return WidgetLoading();
        }

        if (state.msg != null) {
          return WidgetScreenMessage(msg: state.msg!);
        }

        return WidgetUnknownState();
      },
    );
  }

  _buildBtnToday() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: CinematicBottomBar(
        dateText: "Today, 22 Apr",
        formatText: "Hanoi, 3D",
        onDateTap: () {
          //TODO: openCineDatePicker();
        },
        onFormatTap: () {
          //TODO: openCineDatePicker();
        },
      ),
    );
  }

  _openBookSeatTypeScreen(BuildContext context) {
    // TODO:
    BlocProvider.of<BookTimeSlotBloc>(context).add(OpenedBookSeatTypeScreen());
    context.go('/bookSeatType');
  }
}
