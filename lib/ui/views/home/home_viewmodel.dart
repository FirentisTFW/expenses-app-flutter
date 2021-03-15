import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/services/functional_services/database_services/database_service.dart';
import 'package:Expenses_app/services/state_services/categories_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final _databaseService = locator<DatabaseService>();
  final _categoriesService = locator<CategoriesService>();

  Future initialise() async {
    setBusy(true);
    await _databaseService.initialise();
    await _categoriesService
        .getAllCategories(); // make sure categories are fetched when app is initialized
    setBusy(false);
  }
}
