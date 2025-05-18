/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:26:40
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:equatable/equatable.dart';

class GenresEntity extends Equatable {
  final String id;
  final String name;
  final String icon;
  final List<String>? listMovie;

  const GenresEntity({
    required this.id,
    required this.name,
    required this.icon,
    this.listMovie,
  });

  @override
  List<Object> get props => [id, name, icon];

  @override
  String toString() {
    return 'Genres{id: $id, name: $name, icon: $icon}';
  }
}
