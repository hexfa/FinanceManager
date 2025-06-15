import 'package:finance_manager/domain/entities/category_entity.dart';
import 'package:hive/hive.dart';

class CategoryEntityAdapter extends TypeAdapter<CategoryEntity> {
  @override
  final int typeId = 3;

  @override
  CategoryEntity read(BinaryReader reader) {
    return CategoryEntity(name: reader.readString());
  }

  @override
  void write(BinaryWriter writer, CategoryEntity obj) {
    writer.writeString(obj.name);
  }
}
