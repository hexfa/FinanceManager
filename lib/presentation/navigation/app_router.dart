import 'package:finance_manager/core/di/di.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/presentation/bloc/home/home_cubit.dart';
import 'package:finance_manager/presentation/bloc/transaction/detail/transaction_detail_cubit.dart';
import 'package:finance_manager/presentation/bloc/transaction/list/transaction_list_cubit.dart';
import 'package:finance_manager/presentation/bloc/transaction/transaction_cubit.dart';
import 'package:finance_manager/presentation/navigation/route_path.dart';
import 'package:finance_manager/presentation/view/screens/home/home_screen.dart';
import 'package:finance_manager/presentation/view/screens/setting/setting_screen.dart';
import 'package:finance_manager/presentation/view/screens/transaction/create/create_transaction_screen.dart';
import 'package:finance_manager/presentation/view/screens/transaction/detail/detail_transaction_screen.dart';
import 'package:finance_manager/presentation/view/screens/transaction/list/transaction_list_screen.dart';
import 'package:finance_manager/presentation/view/screens/transaction/update/update_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    initialLocation: RoutePath.homeRoute,
    routes: [
      GoRoute(
        path: RoutePath.homeRoute,
        pageBuilder:
            (context, state) => _buildTransitionPage(
              key: state.pageKey,
              child: BlocProvider(
                create: (_) => getIt<HomeCubit>()..loadInitialData(),
                child: const HomeScreen(),
              ),
            ),
      ),
      GoRoute(
        path: RoutePath.createTransactionRoute,
        pageBuilder:
            (context, state) => _buildTransitionPage(
              key: state.pageKey,
              child: BlocProvider(
                create: (_) => getIt<TransactionCubit>(),
                child: const CreateTransactionScreen(),
              ),
            ),
      ),
      GoRoute(
        path: RoutePath.transactionDetailRoute,
        pageBuilder:
            (context, state) => _buildTransitionPage(
              key: state.pageKey,
              child: BlocProvider(
                create:
                    (_) =>
                        getIt<TransactionDetailCubit>()
                          ..getTransactionById(state.extra as int),
                child: DetailTransactionScreen(
                  transactionId: state.extra as int,
                ),
              ),
            ),
      ),
      GoRoute(
        path: RoutePath.updateTransactionRoute,
        pageBuilder: (context, state) {
          return _buildTransitionPage(
            key: state.pageKey,
            child: BlocProvider(
              create: (_) => getIt<TransactionCubit>(),
              child: UpdateTransactionScreen(
                transaction: state.extra as Transaction,
              ),
            ),
          );
        },
      ),
      GoRoute(
        path: RoutePath.settingRoute,
        pageBuilder: (context, state) {
          return _buildTransitionPage(
            key: state.pageKey,
            child: SettingScreen(),
          );
        },
      ),
      GoRoute(
        path: RoutePath.transactionListRoute,
        pageBuilder: (context, state) {
          return _buildTransitionPage(
            key: state.pageKey,
            child: BlocProvider(
              create: (_) => getIt<TransactionListCubit>()..loadInitialData(),
              child: TransactionListScreen(),
            ),
          );
        },
      ),
    ],
    errorBuilder:
        (context, state) =>
            const Scaffold(body: Center(child: Text('404 - Page not found'))),
  );

  CustomTransitionPage _buildTransitionPage({
    required LocalKey key,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: key,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}
