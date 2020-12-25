import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/datamodels/total_expenses.dart';
import 'package:Expenses_app/services/functional_services/database_services/api.dart';

class TotalExpensesService {
  final _api = locator<Api>();

  List<TotalExpenses> _totalMonthlyExpenses;
  List<TotalCategoryExpenses> _totalCategoryExpenses;

  List<TotalExpenses> get totalMonthlyExpenses => _totalMonthlyExpenses;
  List<TotalCategoryExpenses> get totalCategoryExpenses =>
      _totalCategoryExpenses;

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
    _totalCategoryExpenses =
        await _api.getTotalCategoryExpensesInTimeSpan(start, end);
    return _totalCategoryExpenses;
  }

  Future<List<TotalCategoryExpenses>> getThisMonthCategoryExpenses() async {
    final now = DateTime.now();
    final monthStart = DateTime(now.year, now.month);
    _totalCategoryExpenses =
        await _api.getTotalCategoryExpensesInTimeSpan(monthStart, now);
    return _totalCategoryExpenses;
  }

  double getThisMonthTotalSpending() {
    double sum = 0;
    _totalCategoryExpenses
        .forEach((element) => sum += element.totalMoneyAmount);
    return sum;
  }
}
