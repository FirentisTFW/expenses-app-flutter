import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/datamodels/category.dart';
import 'package:Expenses_app/services/state_services/categories_service.dart';
import 'package:stacked/stacked.dart';

class CategoryFilterDialogViewModel extends FutureViewModel<List<Category>> {
  final _categoriesService = locator<CategoriesService>();

  @override
  Future<List<Category>> futureToRun() => _categoriesService.getAllCategories();
}
