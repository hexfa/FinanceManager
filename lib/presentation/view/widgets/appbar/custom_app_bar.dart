import 'package:finance_manager/presentation/view/base/base_stateless_widget.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends BaseStatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String title;
  final List<Widget> actions;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    super.key,
    this.leading,
    required this.title,
    this.actions = const [],
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: theme(context).colorScheme.surface,
      iconTheme: IconThemeData(color: theme(context).colorScheme.onSurface),
      title: Text(
        title,
        style: theme(context).textTheme.titleMedium?.copyWith(
          color: theme(context).colorScheme.onSurface,
        ),
      ),
      actions: actions,
      elevation: 0,
      centerTitle: false,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize {
    // If 'bottom' is null, just return default AppBar height
    if (bottom == null) {
      return const Size.fromHeight(kToolbarHeight);
    } else {
      // If 'bottom' is provided, adjust the height accordingly
      return Size.fromHeight(kToolbarHeight + bottom!.preferredSize.height);
    }
  }
}
