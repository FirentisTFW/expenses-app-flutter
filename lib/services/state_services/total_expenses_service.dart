import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/datamodels/total_expenses.dart';
import 'package:Expenses_app/services/functional_services/api.dart';

class TotalExpensesService {
  final _api = locator<Api>();

  List<TotalExpenses> _totalMonthlyExpenses;
  List<TotalExpenses> get totalMonthlyExpenses => _totalMonthlyExpenses;

  Future<List<TotalExpenses>> getLastMonthsTotalExpenses(int howMany) async {
    _totalMonthlyExpenses =
        await _api.getMonthlyTotalExpensesInLastMonths(howMany);
    return _totalMonthlyExpenses;
  }

  Future<List<TotalExpenses>> getTotalMonthlyExpensesInTimeSpan(
      DateTime start, DateTime end) async {
    _totalMonthlyExpenses =
        await _api.getTotalMonthlyExpensesInTimeSpan(start, end);
    return _totalMonthlyExpenses;
  }

  Future<List<TotalExpenses>> getTotalCategoryExpensesInTimeSpan(
      DateTime start, DateTime end) async {
    _totalMonthlyExpenses =
        await _api.getTotalCategoryExpensesInTimeSpan(start, end);
    return _totalMonthlyExpenses;
  }
}
