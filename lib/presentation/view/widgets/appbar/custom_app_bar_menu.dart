import 'package:finance_manager/data/models/app_bar_menu.dart';
import 'package:finance_manager/presentation/view/base/base_stateless_widget.dart';
import 'package:flutter/material.dart';

class CustomAppBarMenu extends BaseStatelessWidget {
  final List<AppBarMenu> menuItem;

  const CustomAppBarMenu({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(Icons.more_vert, color: theme(context).colorScheme.onSurface),
      onSelected: (int index) {
        menuItem[index].onTap();
      },
      itemBuilder: (BuildContext context) {
        return List.generate(menuItem.length, (index) {
          final item = menuItem[index];
          return PopupMenuItem<int>(
            value: index,
            child: Row(
              children: [
                Icon(item.icon, color: theme(context).colorScheme.onSurface),
                const SizedBox(width: 8),
                Text(item.title),
              ],
            ),
          );
        });
      },
    );
  }
}