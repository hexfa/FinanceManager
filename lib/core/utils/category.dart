import 'package:finance_manager/core/utils/category_type.dart';
import 'package:finance_manager/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class Category {
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

  static String getCategoryIconPath(CategoryType category) {
    switch (category) {
      case CategoryType.food:
        return Assets.icons.food;
      case CategoryType.business:
        return Assets.icons.work;
      case CategoryType.other:
        return Assets.icons.other;
      case CategoryType.education:
        return Assets.icons.education;
      case CategoryType.sport:
        return Assets.icons.sport;
    }
  }
}
