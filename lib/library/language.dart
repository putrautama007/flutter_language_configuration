import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

///
/// Class for managing different configuration.
/// Use it with Language() to access the singleton.
///
class Language {
  static Language _singleton = Language._internal();


  factory Language() {
    return _singleton;
  }

  Language._internal();

  Map<String, dynamic> appConfig = Map<String, dynamic>();

  ///
  /// Loading a json configuration file with the given [name] into the current app config.
  /// The file has to be placed at assets/cfg/
  ///
  Future<Language> loadFromAsset(String fileLangFolder,String fileName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String content;
    if(preferences.getString("lang") == null)
      content = await rootBundle.loadString("assets/languages/$fileLangFolder/$fileName.json");
    else
      content = await rootBundle.loadString("assets/languages/${preferences.getString("lang")}/$fileName.json");
    Map<String, dynamic> configAsMap = json.decode(content);
    configAsMap.forEach((String key, dynamic value) {
      this.appConfig[key] = value;
    });
    return _singleton;
  }

  /// Reads a value of any type from persistent storage.
  dynamic get(String key) => appConfig[key];

  /// Reads a value from persistent storage, throwing an exception if it's not a
  /// bool.
  bool getBool(String key) => appConfig[key];

  /// Reads a value from persistent storage, throwing an exception if it's not
  /// an int.
  int getInt(String key) => appConfig[key];

  /// Reads a value from persistent storage, throwing an exception if it's not a
  /// double.
  double getDouble(String key) => appConfig[key];

  /// Reads a value from persistent storage, throwing an exception if it's not a
  /// String.

  String getString(String key, {List<String> args}) {
    String res = this._resolve(key, this.appConfig);
    if (args != null) {
      args.forEach((String str) {
        res = res.replaceFirst(RegExp(r'{}'), str);
      });
    }
    return res;
  }

  String _resolve(String path, dynamic obj) {
    List<String> keys = path.split('.');

    if (keys.length > 1) {
      for (int index = 0; index <= keys.length; index++) {
        if (obj.containsKey(keys[index]) && obj[keys[index]] is! String) {
          return _resolve(
                  keys.sublist(index + 1, keys.length).join('.'), obj[keys[index]]);
        }

        return obj[path] ?? path;
      }
    }

    return obj[path] ?? path;
  }
  /// Write a value from persistent storage, throwing an exception if it's not
  /// the correct type
  void setValue(key, value) => value.runtimeType != appConfig[key].runtimeType
      ? throw ("wrong type")
      : appConfig.update(key, (dynamic) => value);

  /// Adds any type to the persistent storage.
  add(Map<String, dynamic> map) => appConfig.addAll(map);

}