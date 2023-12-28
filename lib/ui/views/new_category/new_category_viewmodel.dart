import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/datamodels/category.dart';
import 'package:Expenses_app/services/state_services/categories_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NewCategoryViewModel extends BaseViewModel {
  var _categoriesService = locator<CategoriesService>();
  var _navigationService = locator<NavigationService>();
  var _snackbarService = locator<SnackbarService>();

  final formKey = GlobalKey<FormState>();
  String? _categoryName;
  int _iconId = 0;

  void setCategoryName(String? name) => _categoryName = name;

  void setIconId(int id) => _iconId = id;

  Future<void> validateAndAddCategory() async {
    setBusy(true);
    var isValid = formKey.currentState?.validate() ?? false;

    if (isValid) {
      formKey.currentState?.save();
      await addCategoryAndShowSnackbar();
    }
    setBusy(false);
  }

  Future<void> addCategoryAndShowSnackbar() async {
    var isAdded = await addCategory();

    if (isAdded) {
      _navigationService.back();
      showSnackbarWithSuccessMessage();
    } else {
      showSnackbarWithErrorMessage();
    }
  }

  Future<bool> addCategory() async {
    final categoryName = _categoryName;
    if (categoryName == null) throw Exception('Category name must not be null');

    var newCategory = Category(
      id: DateTime.now().millisecondsSinceEpoch,
      name: categoryName,
      iconId: _iconId,
    );

    try {
      await _categoriesService.addCategory(newCategory);
      return true;
    } catch (err) {
      setError(err);
      return false;
    }
  }

  void showSnackbarWithSuccessMessage() => _snackbarService.showSnackbar(
      message: 'Category added succesfully.', duration: Duration(seconds: 2));

  void showSnackbarWithErrorMessage() => _snackbarService.showSnackbar(
      message: modelError.toString(), duration: Duration(seconds: 2));
}
