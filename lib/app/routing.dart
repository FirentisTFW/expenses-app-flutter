import 'package:Expenses_app/ui/views/home/home_view.dart';
import 'package:Expenses_app/ui/views/list_of_expenditures/list_of_expenditures_view.dart';
import 'package:Expenses_app/ui/views/new_category/new_category_view.dart';
import 'package:Expenses_app/ui/views/new_expenditure/new_expenditure_view.dart';
import 'package:Expenses_app/ui/views/trends/trends_view.dart';
import 'package:flutter/material.dart';

abstract final class Routing {
  const Routing._();

  static const String expenditures = 'expenditures';
  static const String home = 'home';
  static const String newCategory = 'new-category';
  static const String newExpenditure = 'new-expenditure';
  static const String trends = 'trends';

  static Route? getRoute(RouteSettings settings) {
    final String? routeName = settings.name;

    final Widget? page = getPage(routeName);
    if (page == null) return null;
    return buildRoute(
      settings: settings,
      child: page,
    );
  }

  static Widget? getPage(String? routeName) {
    switch (routeName) {
      case expenditures:
        return ListOfExpendituresView();
      case home:
        return HomeView();
      case newCategory:
        return NewCategoryView();
      case newExpenditure:
        return NewExpenditureView();
      case trends:
        return TrendsView();
    }

    return null;
  }

  static Route buildRoute({
    required RouteSettings settings,
    bool fullscreenDialog = false,
    required Widget child,
  }) {
    return MaterialPageRoute(
      builder: (_) => child,
      settings: settings,
      fullscreenDialog: fullscreenDialog,
    );
  }
}
