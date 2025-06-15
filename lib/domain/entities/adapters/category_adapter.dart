import 'package:finance_manager/data/models/category.dart';
import 'package:hive/hive.dart';

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 4;

  @override
  Category read(BinaryReader reader) {
    return Category(id: reader.readInt(), name: reader.readString());
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.name);
  }
}
