import 'package:finance_manager/data/models/category.dart';

abstract class CategoryRepository {
  Future<void> createCategory(Category category);
}
