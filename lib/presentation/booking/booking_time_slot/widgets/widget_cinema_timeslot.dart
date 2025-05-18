/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-22 08:45:56
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

// ignore_for_file: must_be_immutable

import 'package:cinema_booking/common/widgets/image/svg_image.dart';
import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/core/configs/assets/app_vectors.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:cinema_booking/domain/entities/show_time/time_slot.dart';
import 'package:cinema_booking/presentation/booking/booking_time_slot/bloc/book_time_slot_bloc.dart';
import 'package:cinema_booking/presentation/booking/model/item_time_slot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetCineTimeSlot extends StatelessWidget {
  final ItemCineTimeSlot item;
  int selectedIndex = -1;
  bool movieCineName = true;
  bool movieCineDot = true;

  WidgetCineTimeSlot(this.item, {super.key});

  WidgetCineTimeSlot.selected({
    super.key,
    required this.item,
    required this.selectedIndex,
    required this.movieCineName,
    required this.movieCineDot,
  });

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withValues(alpha: 0.9),
            Colors.black.withValues(alpha: 0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 12,
            spreadRadius: -3,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Cinema Name & Info Icon
          if (movieCineName)
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    item.cineName,
                    style: AppFont.semibold_white_16.copyWith(
                      shadows: [Shadow(color: Colors.black38, blurRadius: 6)],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _openCineLocation(),
                  child: Icon(
                    Icons.info_outline,
                    color: Colors.white.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          WidgetSpacer(height: 6),

          // Location & Distance
          Row(
            children: <Widget>[
              if (movieCineDot)
                MySvgImage(
                  path: AppVectors.iconCineDot,
                  width: 10,
                  height: 12,
                  color: Colors.white70,
                ),
              WidgetSpacer(width: movieCineDot ? 7 : 0),
              Expanded(
                child: Text(
                  item.textLocation,
                  style: AppFont.regular_white_12,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              WidgetSpacer(width: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "${item.textDistance} km away",
                  style: AppFont.regular_white_10,
                ),
              ),
            ],
          ),
          WidgetSpacer(height: 16),

          // Time Slots
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: <Widget>[
              for (final timeSlot in item.timeSlots)
                _WidgetTimeSlot(
                  timeSlot,
                  item.timeSlots.indexOf(timeSlot) == selectedIndex,
                  selectedIndex != -1,
                  (selectedTimeSlot) {
                    BlocProvider.of<BookTimeSlotBloc>(_context).add(
                      SelectTimeSlot(
                        selectedTimeSlot: selectedTimeSlot,
                        bookTimeSlot: item.bookTimeSlot,
                      ),
                    );
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }

  _openCineLocation() {
    // movieModalBottomSheet(
    //   context: _context,
    //   backgroundColor: Colors.transparent,
    //   isScrollControlled: true,
    //   builder: (context) {
    //     return CineLocationScreen();
    //   },
    // );
  }
}

class _WidgetTimeSlot extends StatefulWidget {
  final ItemTimeSlot item;
  final bool isSelected;
  final bool isSmallMode;
  final Function(TimeSlotEntity) itemClick;

  const _WidgetTimeSlot(
    this.item,
    this.isSelected,
    this.isSmallMode,
    this.itemClick,
  );

  @override
  State<_WidgetTimeSlot> createState() => __WidgetTimeSlotState();
}

class __WidgetTimeSlotState extends State<_WidgetTimeSlot> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    double itemWidth = widget.isSmallMode ? 84.0 : 100.0;
    double fontSize = widget.isSmallMode ? 12.0 : 14.0;

    Color timeColor =
        widget.item.hour % 2 == 0 ? AppColors.green : AppColors.orange;
    if (!widget.item.active) {
      timeColor = AppColors.timeSlotBorder;
    }

    Color itemBorder =
        widget.isSelected ? Colors.transparent : AppColors.timeSlotBorder;

    if (widget.isSelected) {
      timeColor = Colors.white;
    }

    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),
      onTap: () {
        if (!widget.isSmallMode) {
          widget.itemClick(widget.item.timeSlot);
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: itemWidth,
        padding: EdgeInsets.symmetric(vertical: 10),
        margin: EdgeInsets.only(right: 8, bottom: 8),
        decoration: BoxDecoration(
          border: Border.all(color: itemBorder, width: 1),
          borderRadius: BorderRadius.circular(6),
          gradient:
              widget.isSelected
                  ? LinearGradient(
                    colors: [Colors.greenAccent, Colors.green],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                  : LinearGradient(
                    colors: [
                      Colors.white.withValues(alpha: 0.1),
                      Colors.white.withValues(alpha: 0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
          boxShadow:
              widget.isSelected
                  ? [
                    BoxShadow(
                      color: Colors.greenAccent.withValues(alpha: 0.4),
                      blurRadius: 10,
                      spreadRadius: -2,
                      offset: Offset(0, 4),
                    ),
                  ]
                  : [],
        ),
        child: Center(
          child: Text(
            widget.item.time,
            style: AppFont.medium_white_14.copyWith(
              color: timeColor,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
