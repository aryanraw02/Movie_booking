/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-22 08:45:56
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/core/configs/assets/app_images.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:cinema_booking/core/enum/type_seat.dart';
import 'package:cinema_booking/data/models/seats/seat_type.dart';
import 'package:cinema_booking/domain/entities/seats/seat_type.dart';
import 'package:cinema_booking/presentation/booking/booking_seat_type/bloc/book_seat_type_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetHowManySeats extends StatefulWidget {
  const WidgetHowManySeats({super.key});

  @override
  State<WidgetHowManySeats> createState() => _WidgetHowManySeatsState();
}

class _WidgetHowManySeatsState extends State<WidgetHowManySeats> {
  String _selectedSeatTypeImage = AppImages.seatJack;

  void _onSeatTypeChanged(String newImage) {
    setState(() {
      _selectedSeatTypeImage = newImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1B1B2F), Color(0xFF3A3D63)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          WidgetSpacer(height: 34),
          Text(
            'How many seats?',
            style: AppFont.medium_white_22.copyWith(letterSpacing: 1.2),
          ),
          WidgetSpacer(height: 37),

          Image.asset(_selectedSeatTypeImage, height: 100.57),
          WidgetSpacer(height: 60),
          WidgetNumberSeatPicker(),
          WidgetSeatTypePicker(onSeatTypeChanged: _onSeatTypeChanged),
          WidgetSpacer(height: 40),
        ],
      ),
    );
  }
}

/// WidgetSeatTypePicker
class WidgetSeatTypePicker extends StatefulWidget {
  final List<SeatTypeEntity> seatTypes = SeatTypesModel.mockData.toEntities();

  final Function(String) onSeatTypeChanged;

  WidgetSeatTypePicker({super.key, required this.onSeatTypeChanged});

  @override
  State<WidgetSeatTypePicker> createState() => _WidgetSeatTypePickerState();
}

class _WidgetSeatTypePickerState extends State<WidgetSeatTypePicker> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 3 / 4,
        children: <Widget>[
          for (final seatType in widget.seatTypes) _buildItemSeatType(seatType),
        ],
      ),
    );
  }

  _buildItemSeatType(SeatTypeEntity seatType) {
    var index = widget.seatTypes.indexOf(seatType);
    var isSelected = index == _selectedIndex;

    return GestureDetector(
      onTap: () {
        _clickSelectSeatType(index);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? AppColors.green : Colors.black54,
          border: Border.all(
            color: isSelected ? Colors.greenAccent : Colors.grey.shade700,
          ),
          boxShadow:
              isSelected
                  ? [BoxShadow(color: Colors.greenAccent, blurRadius: 10)]
                  : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(seatType.name, style: AppFont.medium_white_14),
            Text(
              '\$${seatType.price}',
              style: AppFont.semibold_white_16.copyWith(
                color: Colors.yellowAccent,
              ),
            ),
            WidgetSpacer(height: 10),
            Text(
              index == 0 ? 'Filling fast' : 'Available',
              style: AppFont.regular_white_12,
            ),
          ],
        ),
      ),
    );
  }

  _clickSelectSeatType(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Update parent widget with the new image
    String newImage = _getImageForSeatType(widget.seatTypes[index].type);
    widget.onSeatTypeChanged(newImage);

    BlocProvider.of<BookSeatTypeBloc>(
      context,
    ).add(ClickSelectSeatType(selectedSeatType: widget.seatTypes[index].type));
  }

  String _getImageForSeatType(TypeSeat seatType) {
    switch (seatType) {
      case TypeSeat.king:
        return AppImages.seatKing;
      case TypeSeat.queen:
        return AppImages.seatQueen;
      case TypeSeat.jack:
        return AppImages.seatJack;
    }
  }
}

/// WidgetNumberSeatPicker
class WidgetNumberSeatPicker extends StatefulWidget {
  const WidgetNumberSeatPicker({super.key});

  @override
  State<WidgetNumberSeatPicker> createState() => _WidgetNumberSeatPickerState();
}

class _WidgetNumberSeatPickerState extends State<WidgetNumberSeatPicker> {
  List<int> seats = List<int>.generate(10, (index) => index + 1);

  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var isSelected = _selectedIndex == index;
            var boxColor = isSelected ? AppColors.green : Colors.black45;
            var textColor = isSelected ? AppColors.white : Colors.white70;

            return GestureDetector(
              onTap: () {
                _clickSelectSeat(index);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: 38,
                height: 38,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow:
                      isSelected
                          ? [
                            BoxShadow(color: Colors.greenAccent, blurRadius: 8),
                          ]
                          : [],
                ),
                child: Center(
                  child: Text(
                    seats[index].toString(),
                    style: AppFont.medium_white_14.copyWith(color: textColor),
                  ),
                ),
              ),
            );
          },
          itemCount: seats.length,
        ),
      ),
    );
  }

  _clickSelectSeat(int index) {
    setState(() {
      _selectedIndex = index;
    });

    BlocProvider.of<BookSeatTypeBloc>(
      context,
    ).add(ClickHowManySeat(seatCount: index + 1));
  }
}
