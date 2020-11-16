import 'package:Expenses_app/services/functional_services/api.dart';
import 'package:Expenses_app/services/functional_services/fake_api.dart';
import 'package:Expenses_app/services/functional_services/storage_api.dart';
import 'package:Expenses_app/services/state_services/expenditures_service.dart';
import 'package:Expenses_app/ui/views/last_expenditures/last_expenditures_viewmodel.dart';
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
  locator
      .registerLazySingleton<ExpendituresService>(() => ExpendituresService());

  locator.registerSingleton<LastExpendituresViewModel>(
      LastExpendituresViewModel());
  locator.registerSingleton<ThisMonthChartViewModel>(ThisMonthChartViewModel());
}
