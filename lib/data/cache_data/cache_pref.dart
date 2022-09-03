import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheData {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData(
      String key, bool isDark) async {
    return await sharedPreferences.setBool(key, isDark);
  }

  static bool? getData(String key) {
    return sharedPreferences.getBool(key);
  }
}
