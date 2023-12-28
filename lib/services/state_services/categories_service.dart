import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/datamodels/category.dart';
import 'package:Expenses_app/services/functional_services/database_services/api.dart';

class CategoriesService {
  final _api = locator<Api>();

  List<Category> _categories = [];
  List<Category> get categories => _categories;

  Future addCategory(Category category) async =>
      await _api.addCategory(category);

  Future<List<Category>> getAllCategories() async {
    _categories = await _api.getAllCategories();
    return _categories;
  }

  int getIconIdForCategory(int categoryId) =>
      _categories.firstWhere((c) => c.id == categoryId).iconId;
}
