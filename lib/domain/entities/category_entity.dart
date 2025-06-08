import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class CategoryEntity extends HiveObject {
  @HiveField(0)
  final String name;

  CategoryEntity({required this.name});
}
