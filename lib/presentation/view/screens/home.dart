import 'package:finance_manager/presentation/base/base_stateless_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends BaseStatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String balance = '\$5,000';
    return Scaffold(
      backgroundColor: theme(context).colorScheme.surface,
      appBar: _homeAbbBar(),
      body: Center(
        child: Column(
          children: [Text(balance, style: theme(context).textTheme.titleLarge)],
        ),
      ),
    );
  }
}

PreferredSizeWidget _homeAbbBar() {
  return AppBar(
    centerTitle: false,
    title: Row(
      children: [
        Icon(Icons.currency_exchange),
        SizedBox(width: 8),
        Text('Balance'),
      ],
    ),
    actions: [
      PopupMenuButton<String>(
        onSelected: (String value) {},
        icon: Icon(Icons.more_vert),
        itemBuilder: (BuildContext context) {
          return {'Setting'}.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: 8),
                  Text(choice),
                ],
              ),
            );
          }).toList();
        },
      ),
    ],
  );
}
