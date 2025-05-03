import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/presentation/view/base/base_stateless_widget.dart';
import 'package:flutter/material.dart';

class CustomTypeSelector extends BaseStatelessWidget {
  final TransactionType? selectedType;
  final ValueChanged<TransactionType> onChanged;

  const CustomTypeSelector({
    super.key,
    required this.selectedType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildChoiceChip(
          theme: theme(context),
          type: TransactionType.income,
          icon: Icons.arrow_downward,
          isSelected: selectedType == TransactionType.income,
        ),
        const SizedBox(width: 12),
        _buildChoiceChip(
          theme: theme(context),
          type: TransactionType.expense,
          icon: Icons.arrow_upward,
          isSelected: selectedType == TransactionType.expense,
        ),
      ],
    );
  }

  Widget _buildChoiceChip({
    required ThemeData theme,
    required TransactionType type,
    required IconData icon,
    required bool isSelected,
  }) {
    return ChoiceChip(
      avatar: Icon(
        icon,
        color:
            type == TransactionType.income
                ? theme.colorScheme.surfaceDim
                : theme.colorScheme.error,
      ),
      label: Text(type.name),
      selected: isSelected,
      onSelected: (_) => onChanged(type),
      selectedColor: theme.colorScheme.primary,
    );
  }
}
