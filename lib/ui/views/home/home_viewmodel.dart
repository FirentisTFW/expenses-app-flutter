import 'package:Expenses_app/ui/views/last_expenditures/last_expenditures_view.dart';
import 'package:Expenses_app/ui/views/this_month_chart/this_month_chart_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends IndexTrackingViewModel {
  String _title = 'Home View';
  String get title => '$_title';

  Widget getViewForIndex() {
    switch (currentIndex) {
      case 0:
        return ThisMonthChartView();
      case 1:
        return LastExpendituresView();
      default:
        return ThisMonthChartView();
    }
  }
}
