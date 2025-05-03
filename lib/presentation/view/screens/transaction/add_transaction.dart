import 'package:finance_manager/presentation/view/base/base_stateless_widget.dart';
import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AddTransaction extends BaseStatelessWidget {
  const AddTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'AddTransaction'),
      body: Container(),
    );
  }
}