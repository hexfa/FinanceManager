import 'package:hive/hive.dart';

// part 'category_entity.g.dart';

@HiveType(typeId: 0)
class CategoryEntity extends HiveObject {
  @HiveField(0)
  final String name;

  CategoryEntity({required this.name});
}
