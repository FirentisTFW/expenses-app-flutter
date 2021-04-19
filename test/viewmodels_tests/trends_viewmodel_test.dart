import 'package:Expenses_app/datamodels/enums/grouping_method.dart';
import 'package:Expenses_app/datamodels/total_expenses.dart';
import 'package:Expenses_app/ui/views/trends/trends_viewmodel.dart';
import 'package:flutter/cupertino.dart';
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
      test(
          'When fetchDataForRequest is called and returns correct values, should return true',
          () async {
        var totalExpensesService = getAndRegisterTotalExpensesServiceMock();
        var model = TrendsViewModel();
        model.setFirstDate(DateTime(2020, 01, 01));
        model.setSecondDate(DateTime(2020, 02, 01));
        model.setGroupingMethod(GroupingMethod.ByCategories);

        when(totalExpensesService.getTotalCategoryExpensesInTimeSpan(
                DateTime(2020, 01, 01), DateTime(2020, 02, 01)))
            .thenAnswer((_) async => [
                  TotalCategoryExpenses(totalMoneyAmount: 222.33, name: 'Bills')
                ]);

        await model.fetchDataForRequest();

        expect(model.isDataFetched, true);
      });
      test(
          'When fetchDataForRequest is called and returns null values, should return false',
          () async {
        var totalExpensesService = getAndRegisterTotalExpensesServiceMock();
        var model = TrendsViewModel();
        model.setFirstDate(DateTime(2020, 01, 01));
        model.setSecondDate(DateTime(2020, 02, 01));
        model.setGroupingMethod(GroupingMethod.ByCategories);

        when(totalExpensesService.getTotalCategoryExpensesInTimeSpan(
                DateTime(2020, 01, 01), DateTime(2020, 02, 01)))
            .thenAnswer((_) async => null);

        await model.fetchDataForRequest();

        expect(model.isDataFetched, false);
      });
      test(
          'When fetchDataForRequest is called and throws error, should return false',
          () async {
        var totalExpensesService = getAndRegisterTotalExpensesServiceMock();
        var model = TrendsViewModel();
        model.setFirstDate(DateTime(2020, 01, 01));
        model.setSecondDate(DateTime(2020, 02, 01));
        model.setGroupingMethod(GroupingMethod.ByCategories);

        when(totalExpensesService.getTotalCategoryExpensesInTimeSpan(
                DateTime(2020, 01, 01), DateTime(2020, 02, 01)))
            .thenAnswer(
                (_) async => throw ErrorDescription('Could not fetch data'));

        await model.fetchDataForRequest();

        expect(model.isDataFetched, false);
      });
    });
    group('data -', () {
      test('When ViewModel is created, should be null', () {
        var model = TrendsViewModel();
        expect(model.data, null);
      });
      test(
          'When fetchDataForRequest is called and returns correct values, should be the returned values',
          () async {
        var totalExpensesService = getAndRegisterTotalExpensesServiceMock();
        var model = TrendsViewModel();
        model.setFirstDate(DateTime(2020, 01, 01));
        model.setSecondDate(DateTime(2020, 02, 01));
        model.setGroupingMethod(GroupingMethod.ByCategories);

        when(totalExpensesService.getTotalCategoryExpensesInTimeSpan(
                DateTime(2020, 01, 01), DateTime(2020, 02, 01)))
            .thenAnswer((_) async => [
                  TotalCategoryExpenses(totalMoneyAmount: 222.33, name: 'Bills')
                ]);

        await model.fetchDataForRequest();

        expect(model.data,
            [TotalCategoryExpenses(totalMoneyAmount: 222.33, name: 'Bills')]);
      });
      test(
          'When fetchDataForRequest is called and returns throws an error, should be null',
          () async {
        var totalExpensesService = getAndRegisterTotalExpensesServiceMock();
        var model = TrendsViewModel();
        model.setFirstDate(DateTime(2020, 01, 01));
        model.setSecondDate(DateTime(2020, 02, 01));
        model.setGroupingMethod(GroupingMethod.ByCategories);

        when(totalExpensesService.getTotalCategoryExpensesInTimeSpan(
                DateTime(2020, 01, 01), DateTime(2020, 02, 01)))
            .thenThrow(Exception('Could not fetch data'));

        await model.fetchDataForRequest();

        expect(model.data, null);
      });
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
    group('hasError -', () {
      test(
          'When _fetchCategoryExpenses is called and throws error, should return true',
          () async {
        var totalExpensesService = getAndRegisterTotalExpensesServiceMock();
        var model = TrendsViewModel();
        model.setFirstDate(DateTime(2020, 01, 01));
        model.setSecondDate(DateTime(2020, 02, 01));
        model.setGroupingMethod(GroupingMethod.ByCategories);

        when(totalExpensesService.getTotalCategoryExpensesInTimeSpan(
                DateTime(2020, 01, 01), DateTime(2020, 02, 01)))
            .thenThrow(ErrorDescription('Could not fetch data'));

        await model.fetchDataForRequest();

        expect(model.hasError, true);
      });
      test(
          'When _fetchCategoryExpenses is called and returns correct values, should return false',
          () async {
        var totalExpensesService = getAndRegisterTotalExpensesServiceMock();
        var model = TrendsViewModel();
        model.setFirstDate(DateTime(2020, 01, 01));
        model.setSecondDate(DateTime(2020, 02, 01));
        model.setGroupingMethod(GroupingMethod.ByCategories);

        when(totalExpensesService.getTotalCategoryExpensesInTimeSpan(
                DateTime(2020, 01, 01), DateTime(2020, 02, 01)))
            .thenAnswer((_) async => [
                  TotalCategoryExpenses(totalMoneyAmount: 222.33, name: 'Bills')
                ]);

        await model.fetchDataForRequest();

        expect(model.hasError, false);
      });
      test(
          'When _fetchCategoryExpenses is called and returns null, should return false',
          () async {
        var totalExpensesService = getAndRegisterTotalExpensesServiceMock();
        var model = TrendsViewModel();
        model.setFirstDate(DateTime(2020, 01, 01));
        model.setSecondDate(DateTime(2020, 02, 01));
        model.setGroupingMethod(GroupingMethod.ByCategories);

        when(totalExpensesService.getTotalCategoryExpensesInTimeSpan(
                DateTime(2020, 01, 01), DateTime(2020, 02, 01)))
            .thenAnswer((_) async => null);

        await model.fetchDataForRequest();

        expect(model.hasError, false);
      });
      test(
          'When _fetchMonthlyExpenses is called and throws error, should return true',
          () async {
        var totalExpensesService = getAndRegisterTotalExpensesServiceMock();
        var model = TrendsViewModel();
        model.setFirstDate(DateTime(2020, 01, 01));
        model.setSecondDate(DateTime(2020, 02, 01));
        model.setGroupingMethod(GroupingMethod.ByMonths);

        when(totalExpensesService.getTotalMonthlyExpensesInTimeSpan(
                DateTime(2020, 01, 01), DateTime(2020, 02, 01)))
            .thenAnswer(
                (_) async => throw ErrorDescription('Could not fetch data'));

        await model.fetchDataForRequest();

        expect(model.hasError, true);
      });
      test(
          'When _fetchMonthlyExpenses is called and returns correct values, should return false',
          () async {
        var totalExpensesService = getAndRegisterTotalExpensesServiceMock();
        var model = TrendsViewModel();
        model.setFirstDate(DateTime(2020, 01, 01));
        model.setSecondDate(DateTime(2020, 02, 01));
        model.setGroupingMethod(GroupingMethod.ByMonths);

        when(totalExpensesService.getTotalMonthlyExpensesInTimeSpan(
                DateTime(2020, 01, 01), DateTime(2020, 02, 01)))
            .thenAnswer((_) async =>
                [TotalMonthlyExpenses(totalMoneyAmount: 3500.22, name: '4')]);

        await model.fetchDataForRequest();

        expect(model.hasError, false);
      });
      test(
          'When _fetchMonthlyExpenses is called and returns null, should return false',
          () async {
        var totalExpensesService = getAndRegisterTotalExpensesServiceMock();
        var model = TrendsViewModel();
        model.setFirstDate(DateTime(2020, 01, 01));
        model.setSecondDate(DateTime(2020, 02, 01));
        model.setGroupingMethod(GroupingMethod.ByMonths);

        when(totalExpensesService.getTotalMonthlyExpensesInTimeSpan(
                DateTime(2020, 01, 01), DateTime(2020, 02, 01)))
            .thenAnswer((_) async => null);

        await model.fetchDataForRequest();

        expect(model.hasError, false);
      });
    });
  });
}
