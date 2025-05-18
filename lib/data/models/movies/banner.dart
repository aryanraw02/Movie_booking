/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:21:26
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/domain/entities/movies/banner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()
class BannerModel {
  String? id;
  @JsonKey(name: 'image')
  String? url;

  BannerModel({this.id, this.url});

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);

  Map<String, dynamic> toJson() => _$BannerModelToJson(this);

  @override
  String toString() {
    return 'Banner{id: $id, url: $url}';
  }
}

extension BannerModelX on BannerModel {
  BannerEntity toEntity() {
    return BannerEntity(id: id ?? "", url: url ?? "");
  }
}
