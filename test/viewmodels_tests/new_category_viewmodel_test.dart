import 'package:Expenses_app/ui/views/new_category/new_category_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../setup/test_helpers.dart';

void main() {
  group('NewCategoryViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('addCategory -', () {
      test(
          'When category properties are correct and api returns no error, function returns true',
          () async {
        var model = NewCategoryViewModel();
        model.setCategoryName('unit testing courses');
        model.setIconId(1);

        expect(await model.addCategory(), true);
      });
      test(
          'When category properties are correct and api throws an error, function returns false',
          () async {
        var categoriesService = getAndRegisterCategoriesServiceMock();
        var model = NewCategoryViewModel();
        model.setCategoryName('unit testing courses');
        model.setIconId(1);

        when(categoriesService.addCategory(any))
            .thenThrow(ErrorDescription('Couldn\'t add category to database.'));

        expect(await model.addCategory(), false);
      });
    });
    group('addCategoryAndShowSnackbar -', () {
      test(
          'When category properties are set correct and api returns no error, SnackbarService shows snackbar with success message',
          () async {
        var snackbarService = getAndRegisterSnackbarServiceMock();
        var model = NewCategoryViewModel();
        model.setCategoryName('unit testing courses');
        model.setIconId(1);

        await model.addCategoryAndShowSnackbar();
        verify(snackbarService.showSnackbar(
            message: 'Category added succesfully.'));
      });
      test(
          'When category properties are set correct and api throws an error, SnackbarService shows snackbar with error message',
          () async {
        var categoriesService = getAndRegisterCategoriesServiceMock();
        var snackbarService = getAndRegisterSnackbarServiceMock();
        var model = NewCategoryViewModel();
        model.setCategoryName('unit testing courses');
        model.setIconId(1);

        when(categoriesService.addCategory(any))
            .thenThrow(ErrorDescription('Couldn\'t add category to database.'));

        await model.addCategoryAndShowSnackbar();
        verify(
            snackbarService.showSnackbar(message: model.modelError.toString()));
      });
    });
  });
}
