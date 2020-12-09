import 'package:Expenses_app/ui/views/last_expenditures/last_expenditures_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:Expenses_app/app/router.gr.dart';

import '../setup/test_helpers.dart';

void main() {
  group('LastExpendituresViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('goToTrendsView -', () {
      test('When called, should navigate to Routes.trendsView', () async {
        var navigationService = getAndRegisterNavigationServiceMock();
        var model = LastExpendituresViewModel();
        await model.goToTrendsView();
        verify(navigationService.navigateTo(Routes.trendsView));
      });
    });
  });
}
