/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:30:45
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/cinema/cinema.dart';
import 'package:equatable/equatable.dart';

class CinemaEntity extends Equatable {
  final String id;
  final String name;
  final String address;
  final int rating;
  final double distance;
  final String photo;
  final double lat;
  final double lng;

  const CinemaEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.rating,
    required this.distance,
    required this.photo,
    required this.lat,
    required this.lng,
  });

  @override
  List<Object> get props => [
    id,
    name,
    address,
    rating,
    distance,
    photo,
    lat,
    lng,
  ];

  @override
  String toString() {
    return 'Cine{id: $id, name: $name, address: $address, rating: $rating, distance: $distance, photo: $photo, lat: $lat, lng: $lng}';
  }
}

extension CinemaEntityX on CinemaEntity {
  CinemaModel toModel() {
    return CinemaModel(
      id: id,
      name: name,
      address: address,
      rating: rating,
      distance: distance,
      photo: photo,
      lat: lat,
      lng: lng,
    );
  }
}
