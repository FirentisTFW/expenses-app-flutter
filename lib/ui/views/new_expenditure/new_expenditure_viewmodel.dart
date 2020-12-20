import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/datamodels/expenditure.dart';
import 'package:Expenses_app/services/state_services/expenditures_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NewExpenditureViewModel extends BaseViewModel {
  var _expendituresService = locator<ExpendituresService>();
  var _navigationService = locator<NavigationService>();
  var _snackbarService = locator<SnackbarService>();

  var formKey = GlobalKey<FormState>();
  String _expenditureName;
  double _moneyAmount;
  int _categoryId;
  var _expenditureDate = DateTime.now();

  DateTime get expenditureDate => _expenditureDate;

  Future<void> validateAndAddExpenditure() async {
    setBusy(true);
    var isValid = formKey.currentState.validate();
    if (isValid) {
      formKey.currentState.save();
      await addExpenditureAndShowSnackbar();
    }
    setBusy(false);
  }

  Future<void> addExpenditureAndShowSnackbar() async {
    var isAdded = await addExpenditure();

    if (isAdded) {
      _navigationService.back();
      showSnackbarWithSuccessMessage();
    } else {
      showSnackbarWithErrorMessage();
    }
  }

  Future<bool> addExpenditure() async {
    final newExpenditure = Expenditure(
      name: _expenditureName,
      categoryId: _categoryId,
      date: _expenditureDate,
      moneyAmount: _moneyAmount,
    );

    try {
      await _expendituresService.addExpenditure(newExpenditure);
      return true;
    } catch (err) {
      setError(err);
      return false;
    }
  }

  void showSnackbarWithSuccessMessage() =>
      _snackbarService.showSnackbar(message: 'Expenditure added succesfully.');

  void showSnackbarWithErrorMessage() =>
      _snackbarService.showSnackbar(message: modelError.toString());

  void setExpenditureName(String name) => _expenditureName = name;

  void setMoneyAmount(double amount) => _moneyAmount = amount;

  void setExpenditureCategory(int categoryId) => _categoryId = categoryId;

  void setExpenditureDate(DateTime date) {
    _expenditureDate = date;
    notifyListeners();
  }
}
