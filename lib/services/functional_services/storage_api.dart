import 'package:Expenses_app/datamodels/expenditure.dart';
import 'package:Expenses_app/datamodels/category.dart';
import 'package:Expenses_app/datamodels/total_monthly_expenses.dart';
import 'package:Expenses_app/services/functional_services/api.dart';

class StorageApi extends Api {
  @override
  Future<void> addCategory(Category category) {
    // TODO: implement addCategory
    throw UnimplementedError();
  }

  @override
  Future<void> addExpenditure(Expenditure expenditure) {
    // TODO: implement addExpenditure
    throw UnimplementedError();
  }

  @override
  Future<List<Category>> getAllCategories() {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }

  @override
  Future<List<Expenditure>> getAllExpenditures() {
    // TODO: implement getAllExpenditures
    throw UnimplementedError();
  }

  @override
  Future<List<Expenditure>> getExpendituresInTimeSpan(
      DateTime start, DateTime end) {
    // TODO: implement getExpendituresInTimeSpan
    throw UnimplementedError();
  }

  @override
  Future<List<Expenditure>> getLastExpenditures({int howMany}) {
    // TODO: implement getLastExpenditures
    throw UnimplementedError();
  }

  @override
  Future<List<TotalMonthlyExpenses>> getMonthlyTotalExpensesInLastMonths(
      int howManyMonths) {
    // TODO: implement getLastMonthsTotalExpensesByCategory
    throw UnimplementedError();
  }

  @override
  Future<List<TotalMonthlyExpenses>> getTotalMonthlyExpensesInTimeSpan(
      DateTime start, DateTime end) {
    // TODO: implement getTotalMonthlyExpensesInTimeSpan
    throw UnimplementedError();
  }

  @override
  Future<List<TotalCategoryExpenses>> getTotalCategoryExpensesInTimeSpan(
      DateTime start, DateTime end) {
    // TODO: implement getTotalCategoryExpensesInTimeSpan
    throw UnimplementedError();
  }
}
