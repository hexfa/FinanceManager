import 'package:finance_manager/core/di/di.dart';
import 'package:finance_manager/domain/entities/adapters/category_type_adapter.dart';
import 'package:finance_manager/domain/entities/adapters/transaction_adapter.dart';
import 'package:finance_manager/domain/entities/transaction_entity.dart';
import 'package:finance_manager/presentation/navigation/app_router.dart';
import 'package:finance_manager/presentation/view/base/base_stateless_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/theme/theme.dart';
import 'core/utils/configuration_key.dart';
import 'domain/entities/adapters/transaction_type_adapter.dart';
import 'presentation/bloc/setting/setting_cubit.dart';
import 'presentation/bloc/setting/setting_state.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionTypeAdapter());
  Hive.registerAdapter(CategoryTypeAdapter());
  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<TransactionEntity>('transactions');

  await setup();

  final prefs = await SharedPreferences.getInstance();
  final isDarkTheme = prefs.getBool(ConfigurationKey.darkTheme) ?? false;
  final currency = prefs.getString(ConfigurationKey.currency) ?? 'USD';

  runApp(MyApp(initialThemeIsDark: isDarkTheme, initialCurrency: currency));
}

class MyApp extends BaseStatelessWidget {
  final bool initialThemeIsDark;
  final String initialCurrency;

  const MyApp({
    super.key,
    required this.initialThemeIsDark,
    required this.initialCurrency,
  });

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return BlocProvider(
      create: (_) => getIt<SettingCubit>(),
      child: BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en'), Locale('fa')],
            routerConfig: appRouter.router,
          );
        },
      ),
    );
  }
}
