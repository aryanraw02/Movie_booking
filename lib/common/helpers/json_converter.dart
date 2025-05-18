/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 09:33:20
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:json_annotation/json_annotation.dart';

/// JSON converter that handles conversion between JSON values and double.
/// It converts a JSON string to a double, or returns the double if already provided.
class StringAsDoubleConverter implements JsonConverter<double, Object> {
  const StringAsDoubleConverter();

  @override
  Object toJson(double object) {
    return object;
  }

  /// Converts a JSON value to a double.
  /// If the JSON value is a String, it parses it into a double.
  /// If the JSON value is already a double, it returns the value.
  /// Throws an exception if the value cannot be converted.
  @override
  double fromJson(Object json) {
    if (json is String) {
      return double.parse(json);
    } else if (json is double) {
      return json;
    }

    throw Exception("Unable to parse $json to double");
  }
}
