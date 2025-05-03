import 'package:finance_manager/presentation/view/base/base_stateless_widget.dart';
import 'package:finance_manager/presentation/view/widgets/app_decoration.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends BaseStatelessWidget {
  final List<String> items;
  final String? selectedValue;
  final String? label;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.selectedValue,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      items:
          items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
      onChanged: onChanged,
      decoration: customInputDecoration(context: context, label: label),
      icon: const Icon(Icons.arrow_drop_down),
    );
  }
}
