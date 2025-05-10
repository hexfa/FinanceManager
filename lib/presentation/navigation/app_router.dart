import 'package:finance_manager/core/di/di.dart';
import 'package:finance_manager/presentation/bloc/home/home_cubit.dart';
import 'package:finance_manager/presentation/navigation/route_path.dart';
import 'package:finance_manager/presentation/view/screens/home/home_screen.dart';
import 'package:finance_manager/presentation/view/screens/transaction/add_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    initialLocation: RoutePath.homeRoute,
    routes: [
      GoRoute(
        path: RoutePath.homeRoute,
        builder:
            (context, state) => BlocProvider(
              create: (_) => getIt<HomeCubit>()..loadInitialData(),
              child: const HomeScreen(),
            ),
      ),
      GoRoute(
        path: RoutePath.addTransactionRoute,
        builder: (context, state) => const AddTransaction(),
      ),
    ],
    errorBuilder:
        (context, state) =>
            const Scaffold(body: Center(child: Text('404 - Page not found'))),
  );
}
