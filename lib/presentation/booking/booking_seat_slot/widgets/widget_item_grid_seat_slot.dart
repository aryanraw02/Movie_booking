/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-22 08:45:56
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:cinema_booking/presentation/booking/booking_seat_slot/bloc/book_seat_slot_bloc.dart';
import 'package:cinema_booking/presentation/booking/booking_seat_slot/model/item_grid_seat_slot_vm.dart';
import 'package:cinema_booking/presentation/booking/booking_seat_slot/model/item_seat_slot_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetItemGridSeatSlot extends StatefulWidget {
  final ItemGridSeatSlotVM itemGridSeatSlotVM;

  const WidgetItemGridSeatSlot({super.key, required this.itemGridSeatSlotVM});

  @override
  State<WidgetItemGridSeatSlot> createState() => _WidgetItemGridSeatSlotState();
}

class _WidgetItemGridSeatSlotState extends State<WidgetItemGridSeatSlot> {
  late ItemGridSeatSlotVM itemGridSeatSlotVM;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    itemGridSeatSlotVM = widget.itemGridSeatSlotVM;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              itemGridSeatSlotVM.seatTypeName,
              style: AppFont.regular_gray4_12,
            ),
            WidgetSpacer(height: 14),
            _buildSlotGrid(),
            WidgetSpacer(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3),
              child: Divider(color: AppColors.gray1, thickness: 2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlotGrid() {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 40, maxHeight: 200),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: itemGridSeatSlotVM.maxColumn,
        scrollDirection: Axis.vertical,
        childAspectRatio: 1,
        crossAxisSpacing: 7,
        mainAxisSpacing: 7,
        children: _generatedGrid(),
      ),
    );
  }

  List<Widget> _generatedGrid() {
    List<Widget> widgets = [];

    for (var itemSeatRowVM in itemGridSeatSlotVM.seatRowVMs) {
      //ITEM ROW NAME
      var itemRowName = Align(
        alignment: Alignment.centerLeft,
        child: Text(itemSeatRowVM.itemRowName, style: AppFont.regular_gray4_12),
      );

      widgets.add(itemRowName);

      //ITEM SEAT SLOT
      List<Widget> widgetSeatSlots =
          itemSeatRowVM.seatSlotVMs.map((itemSeatSlotVM) {
            var itemBgColor = AppColors.seatSlotBg;
            var itemBorderColor = AppColors.seatSlotBgBooked;

            if (itemSeatSlotVM.isBooked) {
              itemBgColor = AppColors.seatSlotBgBooked;
            }

            if (itemSeatSlotVM.isSelected) {
              itemBgColor = AppColors.defaultColor;
              itemBorderColor = Colors.white;
            }

            var itemAvailable = GestureDetector(
              onTap: () {
                _handleSelectSeat(itemSeatSlotVM);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: itemBgColor,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: itemBorderColor, width: 1),
                  boxShadow:
                      itemSeatSlotVM.isSelected
                          ? [
                            BoxShadow(
                              color: AppColors.defaultColor,
                              blurRadius: 8,
                            ),
                          ]
                          : [],
                ),
                //            child: Center(child: Text('${seatRow.rowId}${i + 1}')),
              ),
            );

            var itemEmpty = Container();

            return itemSeatSlotVM.isOff ? itemEmpty : itemAvailable;
          }).toList();

      widgets.addAll(widgetSeatSlots);
    }

    return widgets;
  }

  _handleSelectSeat(ItemSeatSlotVM itemSeatSlotVM) {
    BlocProvider.of<BookSeatSlotBloc>(
      context,
    ).add(ClickSelectSeatSlot(itemSeatSlotVM: itemSeatSlotVM));
  }
}
