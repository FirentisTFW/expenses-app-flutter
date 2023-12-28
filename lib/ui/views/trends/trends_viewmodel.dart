import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/datamodels/enums/grouping_method.dart';
import 'package:Expenses_app/datamodels/total_expenses.dart';
import 'package:Expenses_app/services/functional_services/date_service.dart';
import 'package:Expenses_app/services/state_services/total_expenses_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TrendsViewModel extends BaseViewModel {
  final _totalExpensesService = locator<TotalExpensesService>();

  List<TotalExpenses> _data = [];
  double _totalDataAmount = 0.0;

  final formKey = GlobalKey<FormState>();
  GroupingMethod _groupingMethod = GroupingMethod.ByCategories;
  late DateTime _firstDate = getMonthsForList()[0];
  late DateTime _secondDate = getMonthsForList()[5];

  // FIXME Verify this
  bool get isDataFetched => _data.isNotEmpty;
  List<TotalExpenses> get data => _data;
  List<TotalExpenses> get dataSortedByAmout {
    final data = _data;
    data.sort((a, b) => a.totalMoneyAmount.compareTo(b.totalMoneyAmount));
    return data.reversed.toList();
  }

  double get totalDataAmount => _totalDataAmount;

  GroupingMethod get groupingMethod => _groupingMethod;

  List<DateTime> getMonthsForList() => DateService.getMonthsWithYearsFrom(2019);

  Future saveForm() async {
    formKey.currentState?.save();
    _swapDatesIfNeeded();
    _setSecondDateToLastDayOfMonth();
    await _setBusyAndFetchData();
    notifyListeners();
  }

  Future<void> _setBusyAndFetchData() async {
    setBusy(true);
    clearErrors();
    notifyListeners();
    await fetchDataForRequest();
    setBusy(false);
  }

  @visibleForTesting
  Future<void> fetchDataForRequest() async {
    if (_groupingMethod == GroupingMethod.ByMonths) {
      await _fetchMonthlyExpenses();
    } else if (_groupingMethod == GroupingMethod.ByCategories) {
      await _fetchCategoryExpenses();
    }
  }

  Future<void> _fetchMonthlyExpenses() async {
    try {
      _data = await _totalExpensesService.getTotalMonthlyExpensesInTimeSpan(
          _firstDate, _secondDate);
      _totalDataAmount = _data
          .map((element) => element.totalMoneyAmount)
          .toList()
          .fold(0, (p, e) => p + e);
    } catch (err) {
      setError(err);
    }
  }

  Future<void> _fetchCategoryExpenses() async {
    try {
      _data = await _totalExpensesService.getTotalCategoryExpensesInTimeSpan(
          _firstDate, _secondDate);
      _totalDataAmount = _data
          .map((element) => element.totalMoneyAmount)
          .toList()
          .fold(0, (p, e) => p + e);
    } catch (err) {
      setError(err);
    }
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
      _secondDate = DateService.getLastDayAndSecondOfTheMonth(_secondDate);
}
