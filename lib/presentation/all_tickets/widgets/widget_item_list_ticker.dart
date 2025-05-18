/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-02-22 08:39:35
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/helpers/formatter_helpers.dart';
import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:cinema_booking/data/models/ticket/ticket.dart';
import 'package:flutter/material.dart';

class WidgetItemListTicker extends StatelessWidget {
  final double itemHeight = 148;

  final Ticket ticket;

  const WidgetItemListTicker(this.ticket, {super.key});

  @override
  Widget build(BuildContext context) {
    String banner = ticket.movieBanner;
    String movieName = ticket.movieName;
    String timeSlot = ticket.movieTimeSlot;
    (ticket.bookTime ~/ 1000).MMM_dd_yyyy();
    String cineName = ticket.cineName;

    //
    List<String> seatSlots = ticket.seat.split(";");
    String strSeatSlot = seatSlots[0];
    seatSlots.skip(1).forEach((element) {
      int index = seatSlots.indexOf(element);
      if (index % 2 == 0) {
        strSeatSlot = "$strSeatSlot\n$element";
      } else {
        strSeatSlot = "$strSeatSlot, $element";
      }
    });

    return Container(
      color: AppColors.darkBackground,
      height: itemHeight,
      child: Row(
        children: [
          Image.network(
            banner,
            width: 108,
            height: itemHeight,
            fit: BoxFit.cover,
          ),
          WidgetSpacer(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  movieName,
                  style: AppFont.medium_black2_16.copyWith(fontSize: 16),
                ),
                WidgetSpacer(height: 2),
                Text(timeSlot, style: AppFont.medium.copyWith(fontSize: 14)),
                WidgetSpacer(height: 2),
                Text(
                  cineName,
                  style: AppFont.medium.copyWith(
                    color: AppColors.gray6,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 4),
            child: Container(width: 2, color: AppColors.lightBackground),
          ),
          SizedBox(
            width: 76,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Seat", style: AppFont.regular_black2_12),
                WidgetSpacer(height: 4),
                Text(
                  strSeatSlot,
                  style: AppFont.oswald_regular.copyWith(
                    color: AppColors.defaultColor,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
