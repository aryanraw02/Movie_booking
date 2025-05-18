/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:21:26
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  final String id;
  final String url;

  const BannerEntity({required this.id, required this.url});

  @override
  String toString() {
    return 'Banner{id: $id, url: $url}';
  }

  @override
  List<Object?> get props => [id, url];
}
