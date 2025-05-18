// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieReviewModel _$MovieReviewModelFromJson(Map<String, dynamic> json) =>
    MovieReviewModel(
      id: json['id'] as String?,
      movieId: json['movie_id'] as String?,
      author: json['author'] as String?,
      created: (json['created'] as num?)?.toInt(),
      content: json['content'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$MovieReviewModelToJson(MovieReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'movie_id': instance.movieId,
      'author': instance.author,
      'created': instance.created,
      'content': instance.content,
      'avatar': instance.avatar,
    };
