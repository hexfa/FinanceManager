import 'package:finance_manager/presentation/base/base_stateless_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends BaseStatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _homeAbbBar());
  }
}

PreferredSizeWidget _homeAbbBar() {
  return AppBar(
    title: Row(
      children: [
        Icon(Icons.currency_exchange),
        SizedBox(width: 8),
        Text('Balance'),
      ],
    ),
    centerTitle: false,
  );
}
