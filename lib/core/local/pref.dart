/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-12-13 10:36:32
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

// ignore_for_file: camel_case_types, constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class LocalPref extends Pref {
  @override
  Future<bool> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  @override
  Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return Future.value(prefs.getString(key));
  }
}

class MemoryPref extends Pref {
  Map<String, Object> memoryMap = <String, Object>{};

  @override
  Future<String> getString(String key) {
    return Future.value(memoryMap[key] as String?);
  }

  @override
  Future<bool> saveString(String key, String value) async {
    memoryMap[key] = value;
    return Future.value(true);
  }
}

abstract class Pref {
  Future<bool> saveString(String key, String value);

  Future<String> getString(String key);
}

class DATA_CONST {
  static const String CACHE_SHOW = "CACHE_SHOW";
  static const String CACHE_CINE = "CACHE_CINE";
  static const String CACHE_BOOK_TIME_SLOT = "CACHE_BOOK_TIME_SLOT";
  static const String CACHE_SELECTED_TIME_SLOT = "CACHE_SELECTED_TIME_SLOT";
  static const String CACHE_OTHER_TIME_SLOT = "CACHE_OTHER_TIME_SLOT";
}
