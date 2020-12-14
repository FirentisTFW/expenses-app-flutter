import 'package:Expenses_app/datamodels/enums/grouping_method.dart';
import 'package:Expenses_app/datamodels/total_expenses.dart';
import 'package:Expenses_app/ui/views/trends_view/trends_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../setup/test_helpers.dart';

void main() {
  group('TrendsViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('isDataFetched -', () {
      test('When ViewModel is created, should return false', () {
        var model = TrendsViewModel();
        expect(model.isDataFetched, false);
      });
      //   test(
      //       'When fetchDataForRequest is called and returns correct values, should return true',
      //       () async {
      //     var totalExpensesService = getAndRegisterTotalExpensesServiceMock();
      //     var model = TrendsViewModel();
      //     model.setFirstDate(DateTime(2020, 01, 01));
      //     model.setSecondDate(DateTime(2020, 02, 01));
      //     model.setGroupingMethod(GroupingMethod.ByCategories);

      //     when(await totalExpensesService.getTotalCategoryExpensesInTimeSpan(
      //             DateTime(2020, 01, 01), DateTime(2020, 02, 01)))
      //         .thenReturn([
      //       TotalCategoryExpenses(totalMoneyAmount: 222.33, name: 'Bills')
      //     ]);

      //     print(model.data.toString());

      //     expect(model.isDataFetched, true);
      //   });
    });
    group('fetchDataForRequest -', () {
      test(
          'When _groupingMethod is set to group by categories, calls totalExpensesService for total expenses in time span sorted by categories ',
          () async {
        var totalExpensesService = getAndRegisterTotalExpensesServiceMock();
        var model = TrendsViewModel();
        model.setFirstDate(DateTime(2020, 01, 01));
        model.setSecondDate(DateTime(2020, 02, 01));
        model.setGroupingMethod(GroupingMethod.ByCategories);
        await model.fetchDataForRequest();
        verify(totalExpensesService.getTotalCategoryExpensesInTimeSpan(
            DateTime(2020, 01, 01), DateTime(2020, 02, 01)));
      });
      test(
          'When _groupingMethod is set to group by months, calls totalExpensesService for total expenses in time span sorted by months ',
          () async {
        var totalExpensesService = getAndRegisterTotalExpensesServiceMock();
        var model = TrendsViewModel();
        model.setFirstDate(DateTime(2020, 01, 01));
        model.setSecondDate(DateTime(2020, 02, 01));
        model.setGroupingMethod(GroupingMethod.ByMonths);
        await model.fetchDataForRequest();
        verify(totalExpensesService.getTotalMonthlyExpensesInTimeSpan(
            DateTime(2020, 01, 01), DateTime(2020, 02, 01)));
      });
    });
  });
}
