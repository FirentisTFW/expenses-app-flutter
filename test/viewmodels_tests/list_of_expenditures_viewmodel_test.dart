import 'package:Expenses_app/datamodels/enums/dialog_type.dart';
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
  });
}
