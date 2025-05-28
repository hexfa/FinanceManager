import 'package:flutter/material.dart';
import 'package:finance_manager/presentation/view/widgets/app_decoration.dart';
import 'package:finance_manager/presentation/view/base/base_stateless_widget.dart';

class CustomDropdown<T> extends BaseStatelessWidget {
  final List<T> items;
  final T? value;
  final String? label;
  final ValueChanged<T?> onChanged;
  final String Function(T)? itemLabelBuilder;
  final Widget Function(T)? iconBuilder;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.value,
    this.label,
    this.itemLabelBuilder,
    this.iconBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final Widget? dynamicIcon =
        value != null && iconBuilder != null ? iconBuilder!(value as T) : null;

    return DropdownButtonFormField<T>(
      value: value,
      items:
          items.map((item) {
            final itemLabel = itemLabelBuilder?.call(item) ?? item.toString();
            return DropdownMenuItem<T>(value: item, child: Text(itemLabel));
          }).toList(),
      onChanged: onChanged,
      decoration: customInputDecoration(
        context: context,
        label: label,
        prefixIcon: dynamicIcon,
      ),
      icon: const Icon(Icons.arrow_drop_down),
    );
  }
}
