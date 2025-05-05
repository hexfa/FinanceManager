enum CategoryType { business, food, education, sport, other }

extension CategoryTypeMapper on String {
  CategoryType toCategoryType() {
    return CategoryType.values.firstWhere(
      (e) => e.name == toLowerCase(),
      orElse: () => CategoryType.other,
    );
  }
}
