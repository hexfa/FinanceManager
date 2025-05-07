import 'package:finance_manager/core/di/di.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/main.dart';
import 'package:finance_manager/presentation/bloc/home/home_cubit.dart';
import 'package:finance_manager/presentation/bloc/home/home_state.dart';
import 'package:finance_manager/presentation/bloc/transaction/transaction_cubit.dart';
import 'package:finance_manager/presentation/view/base/base_state.dart';
import 'package:finance_manager/presentation/view/screens/home/transaction_tile.dart';
import 'package:finance_manager/presentation/view/screens/home/income_expense_summury.dart';
import 'package:finance_manager/presentation/view/screens/transaction/add_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  void didPopNext() {
    homeBloc.loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    // List<PieData> data = [];
    List<Transaction> tranactions = [];
    String balance = '\$2,455';
    String income = '\$1,500';
    String expense = '\$343,0';

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is InitialData) {
          // data = state.dataList;
          tranactions = state.transactionList;
        }

        return Scaffold(
          backgroundColor: theme.colorScheme.surface,
          appBar: _homeAbbBar(context, theme, localization),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Text(balance, style: theme.textTheme.titleLarge),
                  IncomeExpenseSummary(income: income, expense: expense),
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
                                Text(
                                  localization.seeAll,
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: theme.colorScheme.surfaceDim,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TransactionTile(data: tranactions),
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (_) => BlocProvider(
                    create: (_) => getIt<TransactionCubit>(),
                    child: const AddTransaction(),
                  ),
            ),
          );
        },
        icon: Icon(Icons.add, color: theme.colorScheme.onSurface),
      ),
      PopupMenuButton<String>(
        onSelected: (String value) {},
        icon: Icon(Icons.more_vert, color: theme.colorScheme.onSurface),
        itemBuilder: (BuildContext context) {
          return {localization.setting}.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Row(
                children: [
                  Icon(Icons.settings, color: theme.colorScheme.onSurface),
                  SizedBox(width: 8),
                  Text(choice),
                ],
              ),
            );
          }).toList();
        },
      ),
    ],
  );
}
