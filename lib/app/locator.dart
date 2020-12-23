import 'package:Expenses_app/services/functional_services/api.dart';
import 'package:Expenses_app/services/functional_services/database_service.dart';
import 'package:Expenses_app/services/functional_services/fake_api.dart';
import 'package:Expenses_app/services/functional_services/storage_api.dart';
import 'package:Expenses_app/services/state_services/categories_service.dart';
import 'package:Expenses_app/services/state_services/expenditures_service.dart';
import 'package:Expenses_app/services/state_services/total_expenses_service.dart';
import 'package:Expenses_app/ui/views/last_expenditures/last_expenditures_viewmodel.dart';
import 'package:Expenses_app/ui/views/this_month_chart/this_month_chart_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = GetIt.instance;

const bool _USE_FAKE_IMPLEMENTATION = true;

void setupLocator() {
  // STACKED SERVICES
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());

  // API, DATABASE
  locator.registerLazySingleton<Api>(
      () => _USE_FAKE_IMPLEMENTATION ? FakeApi() : StorageApi());
  locator.registerLazySingleton<DatabaseService>(() => DatabaseService());
  locator.registerLazySingleton<DatabaseMigrationService>(
      () => DatabaseMigrationService());

  // CUSTOM SERVICES
  locator
      .registerLazySingleton<ExpendituresService>(() => ExpendituresService());
  locator.registerLazySingleton<TotalExpensesService>(
      () => TotalExpensesService());
  locator.registerLazySingleton<CategoriesService>(() => CategoriesService());

  // VIEWMODELS
  locator.registerSingleton<LastExpendituresViewModel>(
      LastExpendituresViewModel());
  locator.registerSingleton<ThisMonthChartViewModel>(ThisMonthChartViewModel());
}
