import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/datamodels/expenditure.dart';
import 'package:Expenses_app/datamodels/category.dart';
import 'package:Expenses_app/datamodels/total_expenses.dart';
import 'package:Expenses_app/services/functional_services/database_services/api.dart';
import 'package:Expenses_app/services/functional_services/database_services/database_service.dart';
import 'package:Expenses_app/services/functional_services/database_services/datatabse_spec.dart';

class StorageApi extends Api {
  final _databaseService = locator<DatabaseService>();

  @override
  Future<void> addCategory(Category category) async {
    try {
      await _databaseService.database
          .insert(DatabaseSpec.CATEGORIES_TABLE_NAME, category.toJson());
    } catch (err) {
      throw err;
    }
  }

  @override
  Future<void> addExpenditure(Expenditure expenditure) async {
    try {
      await _databaseService.database
          .insert(DatabaseSpec.EXPENDITURES_TABLE_NAME, expenditure.toJson());
    } catch (err) {
      throw err;
    }
  }

  @override
  Future<List<Category>> getAllCategories() async {
    try {
      List<Map> categoriesResults = await _databaseService.database
          .query(DatabaseSpec.CATEGORIES_TABLE_NAME);
      return categoriesResults.map((c) => Category.fromJson(c)).toList();
    } catch (err) {
      throw err;
    }
  }

  @override
  Future<List<Expenditure>> getAllExpenditures() async {
    try {
      List<Map> expendituresResults = await _databaseService.database
          .query(DatabaseSpec.EXPENDITURES_TABLE_NAME);
      return expendituresResults.map((c) => Expenditure.fromJson(c)).toList();
    } catch (err) {
      throw err;
    }
  }

  @override
  Future<List<Expenditure>> getExpendituresInTimeSpan(
      DateTime start, DateTime end) async {
    try {
      String startDate = start.toIso8601String();
      String endDate = end.toIso8601String();

      List<Map> expendituresResults = await _databaseService.database.rawQuery(
          "SELECT * FROM ${DatabaseSpec.EXPENDITURES_TABLE_NAME} WHERE expDate >= '$startDate' AND expDate <= '$endDate'");
      return expendituresResults.map((c) => Expenditure.fromJson(c)).toList();
    } catch (err) {
      throw err;
    }
  }

  @override
  Future<List<Expenditure>> getLastExpenditures({int howMany}) async {
    try {
      List<Map> expendituresResults = await _databaseService.database.rawQuery(
          "SELECT * FROM ${DatabaseSpec.EXPENDITURES_TABLE_NAME} ORDER BY id DESC LIMIT $howMany");
      return expendituresResults.map((c) => Expenditure.fromJson(c)).toList();
    } catch (err) {
      throw err;
    }
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
