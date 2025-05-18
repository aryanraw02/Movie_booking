/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:30:45
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/core/api/rest_client.dart';
import 'package:cinema_booking/data/models/seats/seat_type.dart';
import 'package:cinema_booking/service_locator.dart';

abstract class SeatSlotRepository {
  Future<List<SeatTypesModel>> getListSeatSlotBySeatTypes();
}

class MockSeatSlotRepository extends SeatSlotRepository {
  @override
  Future<List<SeatTypesModel>> getListSeatSlotBySeatTypes() {
    return Future.value(SeatTypesModel.mockData);
  }
}

class RemoteSeatSlotRepository extends SeatSlotRepository {
  @override
  Future<List<SeatTypesModel>> getListSeatSlotBySeatTypes() async {
    final client = RestClient(localDio);
    final response = await client.getListSeatSlotBySeatType();
    return response.data;
  }
}
