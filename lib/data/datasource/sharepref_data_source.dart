import 'package:shared_preferences/shared_preferences.dart';

class ShareprefDataSource {
  final SharedPreferences prefs;

  ShareprefDataSource(this.prefs);

  String? getString(String key) {
    return prefs.getString(key);
  }

  Future<void> setString(String key, String value) async {
    await prefs.setString(key, value);
  }

  bool? getBool(String key) {
    return prefs.getBool(key);
  }

  Future<void> setBool(String key, bool value) async {
    await prefs.setBool(key, value);
  }
}
