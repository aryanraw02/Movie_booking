import 'package:cinema_booking/domain/entities/booking/booking_time_slot.dart';
import 'package:cinema_booking/domain/entities/cinema/cinema.dart';
import 'package:cinema_booking/domain/entities/show_time/time_slot.dart';

class ItemTimeSlot {
  String time;
  int hour;
  bool active = false;
  bool selected = false;

  late TimeSlotEntity timeSlot;

  ItemTimeSlot({required this.time, required this.hour, required this.active});

  ItemTimeSlot.fromTimeSlot({required this.timeSlot})
    : time = timeSlot.time,
      hour = timeSlot.hour,
      active = timeSlot.active;
}

class ItemCineTimeSlot {
  late BookTimeSlotEntity bookTimeSlot;
  late String cineName;
  late CinemaEntity cine;
  late String textLocation;
  late String textDistance;
  late List<ItemTimeSlot> timeSlots;

  ItemCineTimeSlot({
    required this.cine,
    required this.textLocation,
    required this.textDistance,
    required this.timeSlots,
  }) : cineName = cine.name;

  ItemCineTimeSlot.fromBookTimeSlot({required this.bookTimeSlot}) {
    cine = bookTimeSlot.cine;
    timeSlots =
        bookTimeSlot.timeSlots
            .map((timeSlot) => ItemTimeSlot.fromTimeSlot(timeSlot: timeSlot))
            .toList();

    cineName = bookTimeSlot.cine.name;
    textLocation = bookTimeSlot.cine.address;
    textDistance = bookTimeSlot.cine.distance.toString();
  }
}
