import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class CategoryEntity extends HiveObject {
  @HiveField(0)
  final String name;

  CategoryEntity({required this.name});

  int get id {
    if (key == null) {
      throw Exception('CategoryEntity must be saved before accessing its id.');
    }
    return key as int;
  }
}
