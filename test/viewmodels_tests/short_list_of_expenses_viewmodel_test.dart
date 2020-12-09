import 'package:Expenses_app/ui/views/last_expenditures/smart_widgets/short_list_of_expenses_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:Expenses_app/app/router.gr.dart';

import '../setup/test_helpers.dart';

void main() {
  group('ShortListOfExpensesViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('goToListOfExpensesView -', () {
      test('When called, should navigate to Routes.listOfExpendituresView',
          () async {
        var navigationService = getAndRegisterNavigationServiceMock();
        var model = ShortListOfExpensesViewModel();
        await model.goToListOfExpensesView();
        verify(navigationService.navigateTo(Routes.listOfExpendituresView));
      });
    });
  });
}
