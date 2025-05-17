import 'package:finance_manager/presentation/bloc/setting/setting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState(currency: 'USD', isDarkTheme: false));

  void changeCurrency(String currency) {
    emit(state.copyWith(currency: currency));
  }

  void toggleDarkTheme(bool value) {
    emit(state.copyWith(isDarkTheme: value));
  }
}
