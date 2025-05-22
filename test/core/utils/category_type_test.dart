import 'package:finance_manager/core/utils/category_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CategoryTypeMapper', () {
    test('returns correct CategoryType for valid lowercase strings', () {
      expect('business'.toCategoryType(), CategoryType.business);
      expect('food'.toCategoryType(), CategoryType.food);
      expect('education'.toCategoryType(), CategoryType.education);
      expect('sport'.toCategoryType(), CategoryType.sport);
    });
  });
}
