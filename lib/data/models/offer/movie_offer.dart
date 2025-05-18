/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:30:45
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/core/enum/offer_type.dart';
import 'package:cinema_booking/domain/entities/offer/movie_offer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_offer.g.dart';

@JsonSerializable()
class MovieOfferModel {
  String? id;
  TypeOffer? type;
  String? title;
  String? content;

  MovieOfferModel({this.id, this.type, this.title, this.content});

  factory MovieOfferModel.fromJson(Map<String, dynamic> json) =>
      _$MovieOfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieOfferModelToJson(this);

  @override
  String toString() {
    return 'Offer{id: $id, type: $type, title: $title, content: $content}';
  }
}

extension MovieOfferModelX on MovieOfferModel {
  MovieOfferEntity toEntity() {
    return MovieOfferEntity(
      id: id!,
      type: type ?? TypeOffer.red,
      title: title!,
      content: content!,
    );
  }
}
