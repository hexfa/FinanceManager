import 'package:finance_manager/core/extension/extension.dart';
import 'package:finance_manager/data/models/category.dart';
import 'package:finance_manager/domain/entities/category_entity.dart';

class CategoryMapper {
  static List<Category> toModelList(List<CategoryEntity> entities) {
    return entities.map((categoryEntity) => categoryEntity.toModel()).toList();
  }

  static List<CategoryEntity> toEntityList(List<Category> models) {
    return models.map((category) => category.toEntity()).toList();
  }
}
