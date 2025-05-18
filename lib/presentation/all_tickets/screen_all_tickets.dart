/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-02-22 08:39:35
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/widgets/image/svg_image.dart';
import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/core/configs/assets/app_images.dart';
import 'package:cinema_booking/core/configs/assets/app_vectors.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:cinema_booking/data/models/ticket/ticket.dart';
import 'package:cinema_booking/presentation/all_tickets/bloc/list_tickets_bloc.dart';
import 'package:cinema_booking/presentation/all_tickets/bloc/list_tickets_state.dart';
import 'package:cinema_booking/presentation/booking/booking_time_slot/widgets/widget_loading.dart';
import 'package:cinema_booking/presentation/booking/booking_time_slot/widgets/widget_screen_message.dart';
import 'package:cinema_booking/presentation/booking/booking_time_slot/widgets/widget_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/widget_item_list_ticker.dart';

class ListTicketsScreen extends StatelessWidget {
  const ListTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create:
              (context) => ListTicketsBloc()..add(OpenScreenListTicketsEvent()),
          child: BlocConsumer<ListTicketsBloc, ListTicketsState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                children: [
                  WidgetToolbar(
                    title: 'My Tickets',
                    actions: MySvgImage.toolbarIcon(AppVectors.iconMore),
                  ),
                  _buildHeader(),
                  Expanded(child: _buildList(state)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          WidgetSpacer(height: 32),
          Image.asset(AppImages.ticket, height: 200),
          WidgetSpacer(height: 8),
          Text(
            'Save 30% off'.toUpperCase(),
            style: AppFont.oswald_regular.copyWith(
              fontSize: 28,
              color: AppColors.defaultColor,
            ),
          ),
          WidgetSpacer(height: 4),
          Text(
            'On April 22, buy a movie ticket at BETA and wear a red shirt to get a free soft drink! 🥤🔥 Grab your friends and enjoy the show!',
            style: AppFont.medium_gray4.copyWith(fontSize: 12),
            textAlign: TextAlign.center,
          ),
          WidgetSpacer(height: 16),
          Container(
            width: 28,
            height: 3,
            decoration: BoxDecoration(
              color: AppColors.defaultColor,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          WidgetSpacer(height: 16),
        ],
      ),
    );
  }

  _buildList(ListTicketsState state) {
    if (state.isLoading) {
      return WidgetLoading();
    }

    if (state.msg != null) {
      return WidgetScreenMessage(msg: state.msg!);
    }

    if (state.data.isNotEmpty) {
      final listTicket = state.data;
      return ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          Ticket ticket = listTicket[index];
          return WidgetItemListTicker(ticket);
        },
        separatorBuilder: (context, index) {
          return WidgetSpacer(height: 16);
        },
        itemCount: listTicket.length,
      );
    }
  }
}
