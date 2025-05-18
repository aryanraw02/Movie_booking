/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:30:45
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/core/enum/offer_type.dart';
import 'package:cinema_booking/data/models/offer/movie_offer.dart';
import 'package:equatable/equatable.dart';

class MovieOfferEntity extends Equatable {
  final String id;
  final TypeOffer type;
  final String title;
  final String content;

  const MovieOfferEntity({
    required this.id,
    required this.type,
    required this.title,
    required this.content,
  });

  @override
  List<Object> get props => [id, type, title, content];

  @override
  String toString() {
    return 'Offer{id: $id, type: $type, title: $title, content: $content}';
  }
}

extension MovieOfferEntityX on MovieOfferEntity {
  MovieOfferModel toModel() {
    return MovieOfferModel(id: id, type: type, title: title, content: content);
  }
}
