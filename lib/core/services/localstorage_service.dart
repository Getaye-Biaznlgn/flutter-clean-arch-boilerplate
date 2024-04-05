import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static final AppPreferences _instance = AppPreferences._internal();

  factory AppPreferences() {
    return _instance;
  }

  AppPreferences._internal();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> saveString(String key, String value) async {
    return _prefs!.setString(key, value);
  }

  Future<String?> readString(String key) async {
    return _prefs!.getString(key);
  }

  Future<bool> deleteString(String key) async {
    return _prefs!.remove(key);
  }

  Future<bool> saveBool(String key, bool value) async {
    return _prefs!.setBool(key, value);
  }

  Future<bool?> readBool(String key) async {
    return _prefs!.getBool(key);
  }

  Future<bool> deleteBool(String key) async {
    return _prefs!.remove(key);
  }

}
