import 'package:Expenses_app/ui/views/new_expenditure/new_expenditure_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../setup/test_helpers.dart';

void main() {
  group('NewExpenditureViewmodel -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('expenditureDate -', () {
      test('When model is created, is set to current date', () {
        var model = NewExpenditureViewModel();
        var currentDate = DateTime.now();
        expect(model.expenditureDate.year, currentDate.year);
        expect(model.expenditureDate.month, currentDate.month);
        expect(model.expenditureDate.day, currentDate.day);
      });
    });
    group('addExpenditure -', () {
      test(
          'When expenditure properties are set correct, function calls expendituresService to add expenditure',
          () async {
        final expendituresService = getAndRegisterExpendituresServiceMock();
        var model = NewExpenditureViewModel();

        model.setExpenditureCategory(1);
        model.setExpenditureName('Groceries');
        model.setMoneyAmount(43.26);

        await model.addExpenditure();
        verify(expendituresService.addExpenditure(any));
      });
      test(
          'When expenditure properties are set correct and api returns no error, function returns true',
          () async {
        var model = NewExpenditureViewModel();
        model.setExpenditureCategory(1);
        model.setExpenditureName('Groceries');
        model.setMoneyAmount(43.26);

        expect(await model.addExpenditure(), true);
        expect(model.hasError, false);
      });
      test(
          'When expenditures properties are set correct and api throws an error, function returns false',
          () async {
        var expendituresService = getAndRegisterExpendituresServiceMock();
        var model = NewExpenditureViewModel();
        model.setExpenditureCategory(1);
        model.setExpenditureName('Groceries');
        model.setMoneyAmount(43.26);

        when(expendituresService.addExpenditure(any)).thenThrow(
            ErrorDescription('Couldn\'t add expenditure to database.'));

        expect(await model.addExpenditure(), false);
      });
      test(
          'When expenditures properties are set correct and api throws an error, function sets error for the ViewModel',
          () async {
        var expendituresService = getAndRegisterExpendituresServiceMock();
        var model = NewExpenditureViewModel();
        model.setExpenditureCategory(1);
        model.setExpenditureName('Groceries');
        model.setMoneyAmount(43.26);

        when(expendituresService.addExpenditure(any)).thenThrow(
            ErrorDescription('Couldn\'t add expenditure to database.'));

        await model.addExpenditure();
        expect(model.hasError, true);
      });
    });
    group('addExpenditureAndShowSnackbar -', () {
      test(
          'When expenditure properties are set correct and api returns no error, SnackbarService shows snackbar with success message',
          () async {
        var snackbarService = getAndRegisterSnackbarServiceMock();
        var model = NewExpenditureViewModel();
        model.setExpenditureCategory(1);
        model.setExpenditureName('Groceries');
        model.setMoneyAmount(43.26);

        await model.addExpenditureAndShowSnackbar();
        verify(snackbarService.showSnackbar(
            message: 'Expenditure added succesfully.',
            duration: Duration(seconds: 2)));
      });
      test(
          'When expenditure properties are set correct and api throws an error, SnackbarService shows snackbar with error',
          () async {
        var expendituresService = getAndRegisterExpendituresServiceMock();

        var snackbarService = getAndRegisterSnackbarServiceMock();
        var model = NewExpenditureViewModel();
        model.setExpenditureCategory(1);
        model.setExpenditureName('Groceries');
        model.setMoneyAmount(43.26);

        when(expendituresService.addExpenditure(any)).thenThrow(
            ErrorDescription('Couldn\'t add expenditure to database.'));

        await model.addExpenditureAndShowSnackbar();
        verify(snackbarService.showSnackbar(
            message: model.modelError.toString(),
            duration: Duration(seconds: 2)));
      });
    });
  });
}
