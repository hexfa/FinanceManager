import 'package:finance_manager/core/di/di.dart';
import 'package:finance_manager/domain/repositories/setting_repository.dart';

class CurrencyService {
  final SettingRepository _repository = getIt<SettingRepository>();

  String currencyCode = 'USD';

  CurrencyService() {
    loadCurrency();
  }

  void loadCurrency() {
    currencyCode = _repository.getCurrency();
  }

  Future<void> notifyCurrencyChanged() async {
    final newCurrency = _repository.getCurrency();
    if (newCurrency != currencyCode) {
      currencyCode = newCurrency;
    }
  }
}
