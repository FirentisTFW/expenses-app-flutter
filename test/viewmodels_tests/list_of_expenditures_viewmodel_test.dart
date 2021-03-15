import 'package:Expenses_app/datamodels/enums/dialog_type.dart';
import 'package:Expenses_app/datamodels/expenditure.dart';
import 'package:Expenses_app/ui/views/list_of_expenditures/list_of_expenditures_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

import '../setup/test_helpers.dart';

void main() {
  group('ListOfExpendituresViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('fetchData -', () {
      test('When called, should get all expenditures from ExpendituresService',
          () async {
        var _expendituresService = getAndRegisterExpendituresServiceMock();
        var model = ListOfExpendituresViewModel();
        await model.fetchData();
        verify(_expendituresService.getAllExpenditures());
        expect(model.hasError, false);
      });
      test(
          'When called and and ExpendituresService returns error, should set error for ViewModel',
          () async {
        var _expendituresService = getAndRegisterExpendituresServiceMock();
        var model = ListOfExpendituresViewModel();

        when(await _expendituresService.getAllExpenditures())
            .thenThrow(ErrorDescription('couldn\'t fetch expenditures'));

        await model.fetchData();
        expect(model.hasError, true);
      });
    });
    group('showPriceFilterDialog -', () {
      test(
          'When called and user enters correct data, should call ExpendituresService to filter expenditures',
          () async {
        var _expendituresService = getAndRegisterExpendituresServiceMock();
        var _dialogService = getAndRegisterDialogServiceMock();
        var model = ListOfExpendituresViewModel();

        when(_dialogService.showCustomDialog(
          title: 'Filter by price',
          mainButtonTitle: 'Filter',
          variant: DialogType.PriceFilter,
          barrierDismissible: true,
        )).thenAnswer(
            (_) async => DialogResponse(confirmed: true, responseData: {
                  'min': '10.00',
                  'max': '50.00',
                }));

        await model.showPriceFilterDialog();
        verify(_expendituresService.getExpendituresByPrice(10.00, 50.00));
      });
      test(
          'When called and user doesn\'t enter data, shouldn\'t call ExpendituresService to filter expenditures',
          () async {
        var _expendituresService = getAndRegisterExpendituresServiceMock();
        var _dialogService = getAndRegisterDialogServiceMock();
        var model = ListOfExpendituresViewModel();

        when(_dialogService.showCustomDialog(
          title: 'Filter by price',
          mainButtonTitle: 'Filter',
          variant: DialogType.PriceFilter,
          barrierDismissible: true,
        )).thenAnswer((_) async => null);

        await model.showPriceFilterDialog();
        verifyNever(_expendituresService.getExpendituresByPrice(
            argThat(anything), argThat(anything)));
      });
    });
    group('showCategoryFilterDialog -', () {
      test(
          'When called and user enters correct data, should call ExpendituresService to filter expenditures',
          () async {
        var _expendituresService = getAndRegisterExpendituresServiceMock();
        var _dialogService = getAndRegisterDialogServiceMock();
        var model = ListOfExpendituresViewModel();

        when(_dialogService.showCustomDialog(
          title: 'Filter by category',
          mainButtonTitle: 'Filter',
          variant: DialogType.CategoryFilter,
          barrierDismissible: true,
        )).thenAnswer((_) async =>
            DialogResponse(confirmed: true, responseData: [1, 2, 3]));

        await model.showCategoryFilterDialog();
        verify(_expendituresService.getExpendituresByCategories([1, 2, 3]));
      });
      test(
          'When called and user doesn\'t enter data, shouldn\'t call ExpendituresService to filter expenditures',
          () async {
        var _expendituresService = getAndRegisterExpendituresServiceMock();
        var _dialogService = getAndRegisterDialogServiceMock();
        var model = ListOfExpendituresViewModel();

        when(_dialogService.showCustomDialog(
          title: 'Filter by category',
          mainButtonTitle: 'Filter',
          variant: DialogType.CategoryFilter,
          barrierDismissible: true,
        )).thenAnswer((_) async => null);

        await model.showCategoryFilterDialog();
        verifyNever(_expendituresService
            .getExpendituresByCategories(argThat(anything)));
      });
    });
    group('showDateFilterDialog -', () {
      test(
          'When called and user enters correct data, should call ExpendituresService to filter expenditures',
          () async {
        var _expendituresService = getAndRegisterExpendituresServiceMock();
        var _dialogService = getAndRegisterDialogServiceMock();
        var model = ListOfExpendituresViewModel();

        when(_dialogService.showCustomDialog(
          title: 'Filter by date',
          mainButtonTitle: 'Filter',
          variant: DialogType.DateFilter,
          barrierDismissible: true,
        )).thenAnswer(
            (_) async => DialogResponse(confirmed: true, responseData: {
                  'startDate': DateTime(2020, 10, 10),
                  'endDate': DateTime(2020, 12, 10),
                }));

        await model.showDateFilterDialog();
        verify(_expendituresService.getExpendituresByDate(
            DateTime(2020, 10, 10), DateTime(2020, 12, 10)));
      });
      test(
          'When called and user doesn\'t enter data, shouldn\'t call ExpendituresService to filter expenditures',
          () async {
        var _expendituresService = getAndRegisterExpendituresServiceMock();
        var _dialogService = getAndRegisterDialogServiceMock();
        var model = ListOfExpendituresViewModel();

        when(_dialogService.showCustomDialog(
          title: 'Filter by date',
          mainButtonTitle: 'Filter',
          variant: DialogType.DateFilter,
          barrierDismissible: true,
        )).thenAnswer((_) async => null);

        await model.showDateFilterDialog();
        verifyNever(_expendituresService.getExpendituresByDate(
            argThat(anything), argThat(anything)));
      });
    });
    group('deleteExpenditure -', () {
      test('When called, calls ExpendituresService to delete expenditure',
          () async {
        var _expendituresService = getAndRegisterExpendituresServiceMock();
        var model = ListOfExpendituresViewModel();

        when(_expendituresService.deleteExpenditureById(1))
            .thenThrow(ErrorDescription('Error'));

        await model.deleteExpenditure(1);
        verify(_expendituresService.deleteExpenditureById(1));
      });
      test('When expenditure is deleted successfuly, function returns true',
          () async {
        var _expendituresService = getAndRegisterExpendituresServiceMock();
        var model = ListOfExpendituresViewModel();

        when(_expendituresService.getAllExpenditures()).thenAnswer((_) async =>
            [Expenditure(id: 0), Expenditure(id: 1), Expenditure(id: 2)]);

        await model.fetchData();

        expect(await model.deleteExpenditure(1), true);
      });
      test('When API throws an error, function returns false', () async {
        var _expendituresService = getAndRegisterExpendituresServiceMock();
        var model = ListOfExpendituresViewModel();

        when(_expendituresService.deleteExpenditureById(1))
            .thenThrow(ErrorDescription('Error'));

        expect(await model.deleteExpenditure(1), false);
      });
      test(
          'When expenditure is deleted successfuly, function removes expenditure from viewmodel local variable',
          () async {
        var _expendituresService = getAndRegisterExpendituresServiceMock();
        var model = ListOfExpendituresViewModel();

        when(_expendituresService.getAllExpenditures()).thenAnswer((_) async =>
            [Expenditure(id: 0), Expenditure(id: 1), Expenditure(id: 2)]);

        await model.fetchData();
        var originalLength = model.expenditures.length;
        await model.deleteExpenditure(0);

        expect(model.expenditures.length, originalLength - 1);
      });
      test(
          'When API throws an error, function doesn\'t remove expenditure from viewmodel local variable',
          () async {
        var _expendituresService = getAndRegisterExpendituresServiceMock();
        var model = ListOfExpendituresViewModel();

        when(_expendituresService.getAllExpenditures()).thenAnswer((_) async =>
            [Expenditure(id: 0), Expenditure(id: 1), Expenditure(id: 2)]);

        await model.fetchData();
        var originalLength = model.expenditures.length;

        when(_expendituresService.deleteExpenditureById(0))
            .thenThrow(ErrorDescription('Error'));

        await model.deleteExpenditure(0);

        expect(model.expenditures.length, originalLength);
      });
      test(
          'When called with wrong parameter (id of inexisting expenditure), function doesn\'t remove anything from viewmodel local variable',
          () async {
        var _expendituresService = getAndRegisterExpendituresServiceMock();
        var model = ListOfExpendituresViewModel();

        when(_expendituresService.getAllExpenditures()).thenAnswer((_) async =>
            [Expenditure(id: 0), Expenditure(id: 1), Expenditure(id: 2)]);

        await model.fetchData();
        var originalLength = model.expenditures.length;

        await model.deleteExpenditure(3);

        expect(model.expenditures.length, originalLength);
      });
    });
  });
}
