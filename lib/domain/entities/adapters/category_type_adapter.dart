import 'package:finance_manager/core/utils/category_type.dart';
import 'package:hive_flutter/adapters.dart';

class CategoryTypeAdapter extends TypeAdapter<CategoryType> {
  @override
  final int typeId = 1;

  @override
  CategoryType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CategoryType.business;
      case 1:
        return CategoryType.food;
      case 2:
        return CategoryType.education;
      case 3:
        return CategoryType.sport;
      case 4:
        return CategoryType.other;
      default:
        return CategoryType.other;
    }
  }

  @override
  void write(BinaryWriter writer, CategoryType obj) {
    switch (obj) {
      case CategoryType.business:
        writer.writeByte(0);
        break;
      case CategoryType.food:
        writer.writeByte(1);
        break;
      case CategoryType.education:
        writer.writeByte(2);
        break;
      case CategoryType.sport:
        writer.writeByte(3);
        break;
      case CategoryType.other:
        writer.writeByte(4);
        break;
    }
  }
}
