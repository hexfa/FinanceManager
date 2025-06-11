import 'package:finance_manager/core/utils/category_type.dart';
import 'package:finance_manager/data/models/category.dart';
import 'package:finance_manager/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CategoryUtils {
  static Color getCategoryColor(Category category) {
    switch (category.name) {
      case 'food':
        return Colors.orange;
      case 'business':
        return Colors.blue;
      case 'other':
        return Colors.purple;
      case 'education':
        return Colors.green;
      case 'sport':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  static String getCategoryIconPath(Category category) {
    switch (category.name) {
      case 'food':
        return Assets.icons.food;
      case 'business':
        return Assets.icons.work;
      case 'other':
        return Assets.icons.other;
      case 'education':
        return Assets.icons.education;
      case 'sport':
        return Assets.icons.sport;
      default:
        return Assets.icons.other;
    }
  }
}
