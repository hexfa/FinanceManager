import 'package:finance_manager/core/utils/category_type.dart';
import 'package:flutter/material.dart';

class CategoryColor {
  static Color getCategoryColor(CategoryType category) {
    switch (category) {
      case CategoryType.food:
        return Colors.orange;
      case CategoryType.business:
        return Colors.blue;
      case CategoryType.other:
        return Colors.purple;
      case CategoryType.education:
        return Colors.green;
      case CategoryType.sport:
        return Colors.grey;
    }
  }
}
