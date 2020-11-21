import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/datamodels/total_monthly_expenses.dart';
import 'package:Expenses_app/services/functional_services/api.dart';

class TotalExpensesService {
  final _api = locator<Api>();

  List<TotalMonthlyExpenses> _totalMonthlyExpenses;
  List<TotalMonthlyExpenses> get totalMonthlyExpenses => _totalMonthlyExpenses;

  Future<List<TotalMonthlyExpenses>> getLastMonthsTotalExpenses(
      int howMany) async {
    _totalMonthlyExpenses = await _api.getLastMonthsTotalExpenses(howMany);
    return _totalMonthlyExpenses;
  }
}
