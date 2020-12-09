import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/services/state_services/expenditures_service.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

class NavigationServiceMock extends Mock implements NavigationService {}

class DialogServiceMock extends Mock implements DialogService {}

class ExpendituresServiceMock extends Mock implements ExpendituresService {}

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

ExpendituresService getAndRegisterExpendituresServiceMock() {
  _removeRegistrationIfExists<ExpendituresService>();
  var service = ExpendituresServiceMock();
  locator.registerSingleton<ExpendituresService>(service);
  return service;
}

void registerServices() {
  getAndRegisterNavigationServiceMock();
  getAndRegisterDialogServiceMock();
  getAndRegisterExpendituresServiceMock();
}

void unregisterServices() {
  locator.unregister<NavigationService>();
  locator.unregister<DialogService>();
  locator.unregister<ExpendituresService>();
}

void _removeRegistrationIfExists<T>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
