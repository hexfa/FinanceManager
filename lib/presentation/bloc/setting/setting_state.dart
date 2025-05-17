class SettingState {
  final String currency;
  final bool isDarkTheme;

  SettingState({required this.currency, required this.isDarkTheme});

  SettingState copyWith({String? currency, bool? isDarkTheme}) {
    return SettingState(
      currency: currency ?? this.currency,
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
    );
  }
}
