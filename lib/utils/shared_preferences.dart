import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferencesHelper {
  ///
  /// Instantiation of the SharedPreferences library
  ///
  static final String _kLanguageCode = "id";
  /// ------------------------------------------------------------
  /// Method that returns the user language code, ‘en’ if not set
  /// ------------------------------------------------------------
  Future<String> getLanguageCode() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(_kLanguageCode) ?? 'id';
  }


  /// ----------------------------------------------------------
  /// Method that saves the user language code
  /// ----------------------------------------------------------
  Future<bool> setLanguageCode(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_kLanguageCode, value);
  }
}