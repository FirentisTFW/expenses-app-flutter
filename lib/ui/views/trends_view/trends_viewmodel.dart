import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/datamodels/enums/grouping_method.dart';
import 'package:Expenses_app/datamodels/total_expenses.dart';
import 'package:Expenses_app/services/functional_services/date_service.dart';
import 'package:Expenses_app/services/state_services/total_expenses_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TrendsViewModel extends BaseViewModel {
  final _totalExpensesService = locator<TotalExpensesService>();

  List<TotalExpenses> _data;

  final formKey = GlobalKey<FormState>();
  GroupingMethod _groupingMethod;
  DateTime _firstDate;
  DateTime _secondDate;

  List<TotalExpenses> get data => _data;
  GroupingMethod get groupingMethod => _groupingMethod;

  bool get isDataFetched => _data != null;

  List<DateTime> getMonthsForList() => DateService.getMonthsWithYearsFrom(2019);

  Future saveForm() async {
    formKey.currentState.save();
    _swapDatesIfNeeded();
    _setSecondDateToLastDayOfMonth();
    await _setBusyAndFetchData();
    notifyListeners();
  }

  Future<void> _setBusyAndFetchData() async {
    setBusy(true);
    notifyListeners();
    await _fetchDataForRequest();
    setBusy(false);
  }

  Future<void> _fetchDataForRequest() async {
    if (_groupingMethod == GroupingMethod.ByMonths) {
      await _fetchMonthlyExpenses();
    } else if (_groupingMethod == GroupingMethod.ByCategories) {
      await _fetchCategoryExpenses();
    }
  }

  Future<void> _fetchMonthlyExpenses() async {
    _data = await _totalExpensesService.getTotalMonthlyExpensesInTimeSpan(
        _firstDate, _secondDate);
  }

  Future<void> _fetchCategoryExpenses() async {
    _data = await _totalExpensesService.getTotalCategoryExpensesInTimeSpan(
        _firstDate, _secondDate);
  }

  void setGroupingMethod(value) => _groupingMethod = value;

  void setFirstDate(value) => _firstDate = value;

  void setSecondDate(value) => _secondDate = value;

  void _swapDatesIfNeeded() {
    if (_firstDate.isAfter(_secondDate)) {
      DateTime temp = _firstDate;
      _firstDate = _secondDate;
      _secondDate = temp;
    }
  }

  void _setSecondDateToLastDayOfMonth() =>
      _secondDate = DateService.setToLastDayOfTheMonth(_secondDate);
}
