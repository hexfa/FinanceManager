import 'package:finance_manager/core/utils/convert_string.dart';
import 'package:finance_manager/data/models/app_bar_menu.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/presentation/bloc/transaction/transaction_cubit.dart';
import 'package:finance_manager/presentation/navigation/route_path.dart';
import 'package:finance_manager/presentation/view/base/base_stateless_widget.dart';
import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar.dart';
import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar_menu.dart';
import 'package:finance_manager/presentation/view/widgets/dialog/custom_confirm_dialog.dart';
import 'package:flutter/material.dart';

class DetailTransactionScreen extends BaseStatelessWidget {
  final Transaction transaction;

  const DetailTransactionScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context, getBloc<TransactionCubit>(context)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title'),
            SizedBox(height: 4),
            Text(transaction.title),
            SizedBox(height: 16),
            Text('Amount'),
            SizedBox(height: 4),
            Text(ConvertString.formatCurrencyFromDouble(transaction.amount)),
            SizedBox(height: 16),
            Text('Category'),
            SizedBox(height: 4),
            Text(transaction.category.name),
            SizedBox(height: 16),
            Text('Date'),
            SizedBox(height: 4),
            Text(ConvertString.formatDate(transaction.date)),
            SizedBox(height: 16),
            Text(transaction.type.name),
          ],
        ),
      ),
    );
  }

  CustomAppBar _appBar(BuildContext context, TransactionCubit cubit) {
    return CustomAppBar(
      title: localization(context).detailTransaction,
      actions: [
        CustomAppBarMenu(
          menuItem: [
            AppBarMenu(
              title: localization(context).update,
              icon: Icons.edit,
              onTap: () {
                goTo(
                  context,
                  RoutePath.createTransactionRoute,
                  extra: transaction,
                );
              },
            ),
            AppBarMenu(
              title: localization(context).delete,
              icon: Icons.delete_outline,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomConfirmDialog(
                      title: 'Delete Transaction',
                      content:
                          'Are you sure you want to delete this transaction?',
                      confirmText: 'Delete',
                      cancelText: 'Cancel',
                      onConfirm: () async {
                        await cubit.deleteTransaction(transaction.id ?? 0);
                        Navigator.of(context).pop();
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
