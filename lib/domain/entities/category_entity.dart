import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class CategoryEntity extends HiveObject {
  @HiveField(0)
  final String name;

  CategoryEntity({required this.name});

  int get id {
    try {
      return key as int;
    } catch (_) {
      return -1;
    }
  }
}
