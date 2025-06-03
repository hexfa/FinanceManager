import 'package:finance_manager/core/extension/extension.dart';
import 'package:finance_manager/domain/entities/category_entity.dart';
import 'package:finance_manager/domain/repositories/category_repository.dart';
import 'package:finance_manager/data/models/category.dart';
import 'package:hive/hive.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final Box<CategoryEntity> box;

  CategoryRepositoryImpl({required this.box});

  @override
  Future<void> createCategory(Category category) async {
    final entity = category.toEntity();
    await box.add(entity);
  }
}
