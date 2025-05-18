// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CinemaModel _$CinemaModelFromJson(Map<String, dynamic> json) => CinemaModel(
  id: json['id'] as String?,
  name: json['name'] as String?,
  address: json['address'] as String?,
  rating: (json['rating'] as num?)?.toInt(),
  distance: (json['distance'] as num?)?.toDouble(),
  photo: json['photo'] as String?,
  lat: (json['lat'] as num?)?.toDouble(),
  lng: (json['lng'] as num?)?.toDouble(),
);

Map<String, dynamic> _$CinemaModelToJson(CinemaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'rating': instance.rating,
      'distance': instance.distance,
      'photo': instance.photo,
      'lat': instance.lat,
      'lng': instance.lng,
    };
