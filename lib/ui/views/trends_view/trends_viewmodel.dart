import 'package:Expenses_app/datamodels/enums/grouping_method.dart';
import 'package:Expenses_app/services/functional_services/date_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TrendsViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  GroupingMethod _groupingMethod;
  DateTime _firstDate;
  DateTime _secondDate;

  List<DateTime> getMonthsForList() {
    return DateService.getMonthsWithYearsFrom(2019);
  }

  Future saveForm() async {
    formKey.currentState.save();
    _swapDatesIfNeeded();
    _setSecondDateToLastDayOfMonth();
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
