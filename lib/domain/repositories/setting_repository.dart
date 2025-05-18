abstract class SettingRepository {
  String getCurrency();

  Future<void> setCurrency(String currency);

  bool isDarkTheme();

  Future<void> setDarkTheme(bool value);
}