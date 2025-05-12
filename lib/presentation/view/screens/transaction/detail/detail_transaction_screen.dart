import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/presentation/view/base/base_stateless_widget.dart';
import 'package:flutter/material.dart';

class DetailTransactionScreen extends BaseStatelessWidget {
  final Transaction transaction;

  const DetailTransactionScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(transaction.title));
  }
}
