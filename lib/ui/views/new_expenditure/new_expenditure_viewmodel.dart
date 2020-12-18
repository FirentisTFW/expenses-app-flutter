import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class NewExpenditureViewModel extends BaseViewModel {
  GlobalKey<FormState> formKey;
  String _expenditureName;
  double _moneyAmount;
  int _categoryId;
  DateTime _expenditureDate;

  DateTime get expenditureDate => _expenditureDate;
  bool get isDateSet => _expenditureDate != null;

  void setExpenditureName(String name) => _expenditureName = name;
  void setMoneyAmount(double amount) => _moneyAmount = amount;
  void setExpenditureCategory(int categoryId) => _categoryId = categoryId;
  void setExpenditureDate(DateTime date) {
    _expenditureDate = date;
    notifyListeners();
  }
}
