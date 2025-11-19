import 'package:finance_manager/core/utils/convert_string.dart';
import 'package:finance_manager/data/models/app_bar_menu.dart';
import 'package:finance_manager/data/models/transaction_chart_data.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/main.dart';
import 'package:finance_manager/presentation/bloc/home/home_cubit.dart';
import 'package:finance_manager/presentation/bloc/home/home_state.dart';
import 'package:finance_manager/presentation/navigation/route_path.dart';
import 'package:finance_manager/presentation/view/base/base_state.dart';
import 'package:finance_manager/presentation/view/screens/home/custom_pie_chart.dart';
import 'package:finance_manager/presentation/view/screens/home/transaction_tile.dart';
import 'package:finance_manager/presentation/view/screens/home/wallet_card.dart';
import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    List<TransactionChartData> data = [];

    List<Transaction> transactions = [];

    double balance = 0, income = 0, expense = 0;

    int transactionLength = 0;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is InitialData) {
          data = state.dataList;

          transactions = state.transactionList;

          income = state.income;
          expense = state.expense;
          balance = state.balance;
          transactionLength = state.transactionLength;
        }

        return Scaffold(
          backgroundColor: theme.colorScheme.surface,
          appBar: _homeAbbBar(),
          body:
              transactions.isEmpty
                  ? Column(
                    children: [
                      WalletCard(
                        balance: balance,
                        income: income,
                        expense: expense,
                        lastUpdate: '',
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            localization.noTransactionsWereRecorded,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                  : SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          WalletCard(
                            balance: balance,
                            income: income,
                            expense: expense,
                            lastUpdate: ConvertString.formatDate(
                              transactions.last.date,
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (data.isNotEmpty)
                            _buildPieChartSection(data, theme),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          localization.transactions,
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    theme.colorScheme.onSurface,
                                              ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            router.push(
                                              RoutePath.transactionListRoute,
                                            );
                                          },
                                          child: Text(
                                            '${localization.seeAll} ($transactionLength)',
                                            style: theme.textTheme.titleSmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      theme
                                                          .colorScheme
                                                          .surfaceDim,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TransactionTile(data: transactions),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
        );
      },
    );
  }

  Widget _buildPieChartSection(
    List<TransactionChartData> data,
    ThemeData theme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // label chart
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.pie_chart,
                size: 20,
                color: theme.colorScheme.onSurface,
              ),
              const SizedBox(width: 8),
              Text(
                localization.expenseChart,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        //chart
        CustomPieChart(data: data),
      ],
    );
  }

  PreferredSizeWidget _homeAbbBar() {
    return AppBar(
      backgroundColor: theme.colorScheme.surface,
      centerTitle: false,
      title: Text(
        localization.financeManager,
        style: theme.textTheme.titleLarge?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
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
}
