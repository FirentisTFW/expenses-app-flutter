import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/datamodels/total_expenses.dart';
import 'package:Expenses_app/services/state_services/total_expenses_service.dart';
import 'package:stacked/stacked.dart';

class ThisMonthChartViewModel
    extends FutureViewModel<List<TotalCategoryExpenses>> {
  final _totalExpensesService = locator<TotalExpensesService>();

  @override
  Future<List<TotalCategoryExpenses>> futureToRun() =>
      _totalExpensesService.getThisMonthCategoryExpenses();

  String getThisMonthTotalSpending() =>
      _totalExpensesService.getThisMonthTotalSpending().toStringAsFixed(2);
}
