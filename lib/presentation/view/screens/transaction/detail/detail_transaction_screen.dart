import 'package:finance_manager/core/theme/colors.dart';
import 'package:finance_manager/core/utils/convert_string.dart';
import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/data/models/app_bar_menu.dart';
import 'package:finance_manager/data/models/category.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/main.dart';
import 'package:finance_manager/presentation/bloc/transaction/detail/transaction_detail_cubit.dart';
import 'package:finance_manager/presentation/bloc/transaction/detail/transaction_detail_state.dart';
import 'package:finance_manager/presentation/navigation/route_path.dart';
import 'package:finance_manager/presentation/view/base/base_state.dart';
import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar.dart';
import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar_menu.dart';
import 'package:finance_manager/presentation/view/widgets/category_label.dart';
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

class _DetailTransactionScreenState extends BaseState<DetailTransactionScreen>

    with RouteAware {

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

                Row(

                  mainAxisSize: MainAxisSize.max,

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    Column(

                      children: [

                        //title
                        Text(

                          transaction?.title ?? '',

                          style: theme.textTheme.titleLarge?.copyWith(

                            fontWeight: FontWeight.bold,

                            color: theme.colorScheme.onSurface,

                          ),

                        ),

                        SizedBox(height: 12),

                        //date
                        Text(

                          ConvertString.formatDate(

                            transaction?.date ?? DateTime.now(),

                          ),

                          style: theme.textTheme.labelMedium?.copyWith(

                            color: theme.colorScheme.tertiary,

                          ),

                        ),

                      ],

                    ),
                    //amount
                    _buildAmount(),

                  ],

                ),

                SizedBox(height: 16),

                CategoryLabel(

                  category:

                      transaction?.category ??

                      Category(id: 1, name: localization.other),

                ),

                SizedBox(height: 16),

                if ((transaction?.description ?? '').isNotEmpty)

                  buildDescription(),

              ],

            ),

          );

        },

      ),

    );

  }

  Container buildDescription() {

    return Container(

      width: double.infinity,

      height: 200,

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(

        color: theme.colorScheme.surfaceContainer,

        borderRadius: BorderRadius.circular(8),

      ),

      child: Text(

        transaction?.description ?? '',

        style: theme.textTheme.bodyMedium?.copyWith(

          color: theme.colorScheme.onSurface,

        ),

      ),

    );

  }


  Container _buildAmount() {

    Color amountColor =

        transaction?.type == TransactionType.income

            ? incomeColor

            : expenseColor;

    return Container(

      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),

      decoration: BoxDecoration(

        border: Border.all(color: amountColor, width: 1.5),

        borderRadius: BorderRadius.circular(8),

      ),

      child: Row(

        children: [

          Icon(Icons.currency_exchange, color: amountColor),

          const SizedBox(width: 4),

          Text(

            ConvertString.formatCurrencyFromDouble(transaction?.amount ?? 0),

            style: theme.textTheme.titleMedium?.copyWith(

              color: amountColor,

              fontWeight: FontWeight.bold,

            ),

          ),

        ],

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

