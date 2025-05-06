import 'package:finance_manager/core/utils/category_type.dart';
import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:hive/hive.dart';

class TransactionAdapter extends TypeAdapter<Transaction> {
  @override
  final int typeId = 2;

  @override
  Transaction read(BinaryReader reader) {
    return Transaction(
      id: reader.readString(),
      title: reader.readString(),
      amount: reader.readDouble(),
      type: reader.read() as TransactionType,
      category: reader.read() as CategoryType,
      date: DateTime.fromMillisecondsSinceEpoch(reader.readInt()),
    );
  }

  @override
  void write(BinaryWriter writer, Transaction obj) {
    writer.writeString(obj.title);
    writer.writeDouble(obj.amount);
    writer.write(obj.type);
    writer.write(obj.category);
    writer.writeInt(obj.date.millisecondsSinceEpoch);
  }
}
