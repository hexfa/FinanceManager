import 'package:finance_manager/data/models/category.dart';
import 'package:finance_manager/presentation/bloc/base/base_bloc_state.dart';

class CategoryState extends BaseBlocState {
  final List<Category> categories;

  const CategoryState({this.categories = const []});

  CategoryState copyWith({List<Category>? categories}) {
    return CategoryState(categories: categories ?? this.categories);
  }
}
