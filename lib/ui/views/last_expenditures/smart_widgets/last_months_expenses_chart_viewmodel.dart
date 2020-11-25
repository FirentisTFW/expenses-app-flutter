import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/datamodels/total_monthly_expenses.dart';
import 'package:Expenses_app/services/state_services/total_expenses_service.dart';
import 'package:stacked/stacked.dart';

class LastMonthsExpensesChartViewModel
    extends FutureViewModel<List<TotalExpenses>> {
  final _totalExpensesService = locator<TotalExpensesService>();

  @override
  Future<List<TotalExpenses>> futureToRun() =>
      _totalExpensesService.getLastMonthsTotalExpenses(4);
}
