import 'package:finance_manager/data/models/currency.dart';

class SettingState {
  final Currency currency;
  final bool isDarkTheme;

  SettingState({required this.currency, required this.isDarkTheme});

  SettingState copyWith({Currency? currency, bool? isDarkTheme}) {
    return SettingState(
      currency: currency ?? this.currency,
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
    );
  }
}
