import 'package:finance_manager/core/utils/convert_string.dart';
import 'package:finance_manager/data/models/app_bar_menu.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/main.dart';
import 'package:finance_manager/presentation/bloc/home/home_cubit.dart';
import 'package:finance_manager/presentation/bloc/home/home_state.dart';
import 'package:finance_manager/presentation/navigation/route_path.dart';
import 'package:finance_manager/presentation/view/base/base_state.dart';
import 'package:finance_manager/presentation/view/screens/home/transaction_tile.dart';
import 'package:finance_manager/presentation/view/screens/home/income_expense_summury.dart';
import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends BaseState<HomeScreen> with RouteAware {
  late HomeCubit homeBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homeBloc = context.read<HomeCubit>();
    homeBloc.loadInitialData();

    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // List<PieData> data = [];
    List<Transaction> transaction = [];
    double balance = 0, income = 0, expense = 0;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is InitialData) {
          // data = state.dataList;
          transaction = state.transactionList;
          income = state.income;
          expense = state.expense;
          balance = state.balance;
        }

        return Scaffold(
          backgroundColor: theme.colorScheme.surface,
          appBar: _homeAbbBar(context, theme, localization, router),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Text(
                    ConvertString.formatCurrencyFromDouble(balance),
                    style: theme.textTheme.titleLarge,
                  ),
                  IncomeExpenseSummary(
                    income: ConvertString.formatCurrencyFromDouble(income),
                    expense: ConvertString.formatCurrencyFromDouble(expense),
                  ),
                  // CustomPieChart(data: data),
                  Card(
                    color: theme.colorScheme.surfaceContainer,
                    margin: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  localization.transactions,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    router.push(RoutePath.transactionListRoute);
                                  },
                                  child: Text(
                                    localization.seeAll,
                                    style: theme.textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: theme.colorScheme.surfaceDim,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TransactionTile(data: transaction),
                        ],
                      ),
                    ),
                  ),
                  // PieDataList(data: data),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

PreferredSizeWidget _homeAbbBar(
  BuildContext context,
  ThemeData theme,
  AppLocalizations localization,
  GoRouter router,
) {
  return AppBar(
    backgroundColor: theme.colorScheme.surface,
    centerTitle: false,
    title: Row(
      children: [
        Icon(Icons.currency_exchange, color: theme.colorScheme.onSurface),
        SizedBox(width: 8),
        Text(
          localization.balance,
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
      ],
    ),
    actions: [
      IconButton(
        onPressed: () {
          router.push(RoutePath.createTransactionRoute);
        },
        icon: Icon(Icons.add, color: theme.colorScheme.onSurface),
      ),
      CustomAppBarMenu(
        menuItem: [
          AppBarMenu(
            title: localization.setting,
            icon: Icons.settings,
            onTap: () {
              router.push(RoutePath.settingRoute);
            },
          ),
        ],
      ),
    ],
  );
}
