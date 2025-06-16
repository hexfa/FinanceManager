import 'package:finance_manager/domain/repositories/category_repository.dart';
import 'package:finance_manager/presentation/bloc/base/base_cubit.dart';
import 'package:finance_manager/presentation/bloc/category/category_state.dart';
import 'package:finance_manager/data/models/category.dart';

class CategoryCubit extends BaseCubit<CategoryState> {
  final CategoryRepository repository;

  CategoryCubit({required this.repository}) : super(CategoryState());

  Future<void> create(String name) async {
    await repository.createCategory(Category(id: 0, name: name));
  }

  Future<void> getAll() async {
    List<Category> categories = await repository.getAllCategories();
    if (categories.isEmpty) {
      await repository.createDefaultCategories([
        'Business',
        'Food',
        'Education',
        'Sport',
        'Other',
      ]);
      categories = await repository.getAllCategories();
    }
    emit(state.copyWith(categories: categories));
  }
}
