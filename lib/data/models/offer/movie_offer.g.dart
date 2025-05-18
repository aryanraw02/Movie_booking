// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieOfferModel _$MovieOfferModelFromJson(Map<String, dynamic> json) =>
    MovieOfferModel(
      id: json['id'] as String?,
      type: $enumDecodeNullable(_$TypeOfferEnumMap, json['type']),
      title: json['title'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$MovieOfferModelToJson(MovieOfferModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$TypeOfferEnumMap[instance.type],
      'title': instance.title,
      'content': instance.content,
    };

const _$TypeOfferEnumMap = {TypeOffer.red: 'red', TypeOffer.green: 'green'};
