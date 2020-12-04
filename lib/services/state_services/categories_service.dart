import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/datamodels/category.dart';
import 'package:Expenses_app/services/functional_services/api.dart';

class CategoriesService {
  final _api = locator<Api>();

  List<Category> _categories;
  List<Category> get categories => _categories;

  Future<List<Category>> getAllCategories() async {
    _categories = await _api.getAllCategories();
    return _categories;
  }
}
