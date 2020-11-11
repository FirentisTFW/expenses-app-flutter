import 'package:Expenses_app/services/functional_services/api.dart';
import 'package:Expenses_app/services/functional_services/fake_api.dart';
import 'package:Expenses_app/services/functional_services/storage_api.dart';
import 'package:Expenses_app/ui/views/list_of_expenses/list_of_expenses_viewmodel.dart';
import 'package:Expenses_app/ui/views/this_month_chart/this_month_chart_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = GetIt.instance;

const bool _USE_FAKE_IMPLEMENTATION = true;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton<Api>(
      () => _USE_FAKE_IMPLEMENTATION ? FakeApi() : StorageApi());

  locator.registerSingleton<ListOfExpensesViewModel>(ListOfExpensesViewModel());
  locator.registerSingleton<ThisMonthChartViewModel>(ThisMonthChartViewModel());
}
