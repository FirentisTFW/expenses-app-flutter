import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/services/functional_services/database_services/database_service.dart';
import 'package:Expenses_app/services/state_services/categories_service.dart';
import 'package:Expenses_app/ui/views/last_expenditures/last_expenditures_view.dart';
import 'package:Expenses_app/ui/views/this_month_chart/this_month_chart_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final _databaseService = locator<DatabaseService>();
  final _categoriesService = locator<CategoriesService>();

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

  Future initialise() async {
    await _databaseService.initialise();
    await _categoriesService
        .getAllCategories(); // make sure categories are fetched when app is initialized
  }
}
