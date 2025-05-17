import 'package:finance_manager/presentation/view/base/base_stateless_widget.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends BaseStatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme(context).textTheme.bodyMedium?.copyWith(
            color: theme(context).colorScheme.onSurface,
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor:
              value
                  ? theme(context).colorScheme.primary
                  : theme(context).colorScheme.tertiary,
          inactiveThumbColor: theme(context).colorScheme.tertiary,
          inactiveTrackColor: theme(context).colorScheme.tertiaryContainer,
        ),
      ],
    );
  }
}
