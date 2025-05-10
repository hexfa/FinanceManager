import 'package:finance_manager/presentation/navigation/route_path.dart';
import 'package:finance_manager/presentation/view/screens/home/home_screen.dart';
import 'package:finance_manager/presentation/view/screens/transaction/add_transaction_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    initialLocation: AppRoutePath.homeRoute,
    routes: [
      GoRoute(
        path: AppRoutePath.homeRoute,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutePath.addTransactionRoute,
        builder: (context, state) => const AddTransaction(),
      ),
    ],
  );
}
