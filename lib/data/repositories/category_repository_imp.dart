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

  @override
  Future<List<Category>> getAllCategories() async {
    return box.values
        .map((e) => Category(id: e.key as int, name: e.name))
        .toList();
  }

  @override
  Future<void> createDefaultCategories(List<String> categoriesName) async {
    final List<CategoryEntity> entities = [];
    for (var name in categoriesName) {
      entities.add(CategoryEntity(name: name));
    }
    await box.addAll(entities);
  }
}
