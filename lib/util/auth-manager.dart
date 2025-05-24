import 'package:ecommerc_training/gitit/gitit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static final ValueNotifier<String?> authCahngeNotifier = ValueNotifier(null);
  static final SharedPreferences _sharedPreferences = locator.get();

  static void saveToken(String token) {
    _sharedPreferences.setString('access_token', token);
    authCahngeNotifier.value = token;
  }

  static String readAuth() {
    return _sharedPreferences.getString('access_token') ?? '';
  }

  static void logout() {
    _sharedPreferences.clear();
    authCahngeNotifier.value = null;
  }
}
