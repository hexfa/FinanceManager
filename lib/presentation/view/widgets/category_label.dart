import 'package:finance_manager/core/utils/category.dart';
import 'package:finance_manager/core/utils/category_type.dart';
import 'package:finance_manager/presentation/view/base/base_stateless_widget.dart';
import 'package:flutter/material.dart';

class CategoryLabel extends BaseStatelessWidget {
  final CategoryType category;

  const CategoryLabel({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        getIcon(
          CategoryUtils.getCategoryIconPath(category),
          color: theme(context).colorScheme.onSurface,
        ),
        const SizedBox(width: 8),
        Text(
          category.name,
          style: theme(context).textTheme.titleMedium?.copyWith(
            color: theme(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
