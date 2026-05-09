import 'package:finance_manager/domain/repositories/setting_repository.dart';

class FakeSettingRepository implements SettingRepository {
  String _currencyCode;
  bool _darkTheme;
  FakeSettingRepository({
    String initialCurrencyCode = 'USD',
    bool initialDarkTheme = false,
  }) : _currencyCode = initialCurrencyCode,
       _darkTheme = initialDarkTheme;


  String? lastSetCurrencyCode;

  bool? lastSetDarkTheme;



  @override

  String getCurrency() => _currencyCode;



  @override

  bool isDarkTheme() => _darkTheme;



  @override

  Future<void> setCurrency(String code) async {

    lastSetCurrencyCode = code;

    _currencyCode = code;

  }



  @override

  Future<void> setDarkTheme(bool value) async {

    lastSetDarkTheme = value;

    _darkTheme = value;


  }

}

