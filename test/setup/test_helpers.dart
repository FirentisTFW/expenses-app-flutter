import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/services/functional_services/api.dart';
import 'package:Expenses_app/services/state_services/expenditures_service.dart';
import 'package:Expenses_app/services/state_services/total_expenses_service.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

class NavigationServiceMock extends Mock implements NavigationService {}

class DialogServiceMock extends Mock implements DialogService {}

class SnackbarServiceMock extends Mock implements SnackbarService {}

class ExpendituresServiceMock extends Mock implements ExpendituresService {}

class TotalExpensesServiceMock extends Mock implements TotalExpensesService {}

class ApiMock extends Mock implements Api {}

NavigationService getAndRegisterNavigationServiceMock() {
  _removeRegistrationIfExists<NavigationService>();
  var service = NavigationServiceMock();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

DialogService getAndRegisterDialogServiceMock() {
  _removeRegistrationIfExists<DialogService>();
  var service = DialogServiceMock();
  locator.registerSingleton<DialogService>(service);
  return service;
}

SnackbarService getAndRegisterSnackbarServiceMock() {
  _removeRegistrationIfExists<SnackbarService>();
  var service = SnackbarServiceMock();
  locator.registerSingleton<SnackbarService>(service);
  return service;
}

ExpendituresService getAndRegisterExpendituresServiceMock() {
  _removeRegistrationIfExists<ExpendituresService>();
  var service = ExpendituresServiceMock();
  locator.registerSingleton<ExpendituresService>(service);
  return service;
}

TotalExpensesService getAndRegisterTotalExpensesServiceMock() {
  _removeRegistrationIfExists<TotalExpensesService>();
  var service = TotalExpensesServiceMock();
  locator.registerSingleton<TotalExpensesService>(service);
  return service;
}

Api getAndRegisterApiMock() {
  _removeRegistrationIfExists<Api>();
  var service = ApiMock();
  locator.registerSingleton<Api>(service);
  return service;
}

void registerServices() {
  getAndRegisterNavigationServiceMock();
  getAndRegisterDialogServiceMock();
  getAndRegisterSnackbarServiceMock();
  getAndRegisterExpendituresServiceMock();
  getAndRegisterTotalExpensesServiceMock();
  getAndRegisterApiMock();
}

void unregisterServices() {
  locator.unregister<NavigationService>();
  locator.unregister<DialogService>();
  locator.unregister<SnackbarService>();
  locator.unregister<ExpendituresService>();
  locator.unregister<TotalExpensesService>();
  locator.unregister<Api>();
}

void _removeRegistrationIfExists<T>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
