import 'package:finance_manager/core/utils/convert_string.dart';
import 'package:finance_manager/data/models/app_bar_menu.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/presentation/navigation/route_path.dart';
import 'package:finance_manager/presentation/view/base/base_stateless_widget.dart';
import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar.dart';
import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar_menu.dart';
import 'package:flutter/material.dart';

class DetailTransactionScreen extends BaseStatelessWidget {
  final Transaction transaction;

  const DetailTransactionScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
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
          ],
        ),
      ),
    );
  }

  CustomAppBar _appBar(BuildContext context) {
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
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
