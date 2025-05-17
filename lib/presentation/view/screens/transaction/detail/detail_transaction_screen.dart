import 'package:finance_manager/core/utils/convert_string.dart';
import 'package:finance_manager/data/models/app_bar_menu.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/main.dart';
import 'package:finance_manager/presentation/bloc/transaction/detail/transaction_detail_cubit.dart';
import 'package:finance_manager/presentation/bloc/transaction/detail/transaction_detail_state.dart';
import 'package:finance_manager/presentation/navigation/route_path.dart';
import 'package:finance_manager/presentation/view/base/base_state.dart';
import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar.dart';
import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar_menu.dart';
import 'package:finance_manager/presentation/view/widgets/dialog/custom_confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailTransactionScreen extends StatefulWidget {
  final int transactionId;

  const DetailTransactionScreen({super.key, required this.transactionId});

  @override
  State<DetailTransactionScreen> createState() =>
      _DetailTransactionScreenState();
}

class _DetailTransactionScreenState extends BaseState<DetailTransactionScreen> with RouteAware {
  Transaction? transaction;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getBloc<TransactionDetailCubit>().getTransactionById(widget.transactionId);

    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: BlocBuilder<TransactionDetailCubit, TransactionDetailState>(
        builder: (context, state) {
          transaction = state.transaction;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Title'),
                SizedBox(height: 4),
                Text(transaction?.title ?? ''),
                SizedBox(height: 16),
                Text('Amount'),
                SizedBox(height: 4),
                Text(
                  ConvertString.formatCurrencyFromDouble(
                    transaction?.amount ?? 0,
                  ),
                ),
                SizedBox(height: 16),
                Text('Category'),
                SizedBox(height: 4),
                Text(transaction?.category.name ?? ''),
                SizedBox(height: 16),
                Text('Date'),
                SizedBox(height: 4),
                Text(
                  ConvertString.formatDate(transaction?.date ?? DateTime.now()),
                ),
                SizedBox(height: 16),
                Text(transaction?.type.name ?? ''),
              ],
            ),
          );
        },
      ),
    );
  }

  CustomAppBar _appBar() {
    return CustomAppBar(
      title: localization.detailTransaction,
      actions: [
        CustomAppBarMenu(
          menuItem: [
            AppBarMenu(
              title: localization.update,
              icon: Icons.edit,
              onTap: () async {
                goTo(RoutePath.updateTransactionRoute, extra: transaction);
              },
            ),
            AppBarMenu(
              title: localization.delete,
              icon: Icons.delete_outline,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomConfirmDialog(
                      title: localization.deleteTransaction,
                      content:
                          localization.areYouSureYouWantToDeleteThisTransaction,
                      confirmText: localization.delete,
                      onConfirm: () async {
                        await getBloc<TransactionDetailCubit>()
                            .deleteTransaction(widget.transactionId);
                        navigator.pop();
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
