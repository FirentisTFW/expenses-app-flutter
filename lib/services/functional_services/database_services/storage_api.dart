import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/datamodels/expenditure.dart';
import 'package:Expenses_app/datamodels/category.dart';
import 'package:Expenses_app/datamodels/total_expenses.dart';
import 'package:Expenses_app/services/functional_services/database_services/api.dart';
import 'package:Expenses_app/services/functional_services/database_services/database_service.dart';
import 'package:Expenses_app/services/functional_services/database_services/db_spec.dart';

class StorageApi extends Api {
  final _databaseService = locator<DatabaseService>();

  @override
  Future<void> addCategory(Category category) async {
    try {
      await _databaseService.database
          .insert(DbSpec.T_CATEGORIES, category.toJson());
    } catch (err) {
      throw err;
    }
  }

  @override
  Future<void> addExpenditure(Expenditure expenditure) async {
    try {
      await _databaseService.database
          .insert(DbSpec.T_EXPENDITURES, expenditure.toJson());
    } catch (err) {
      throw err;
    }
  }

  @override
  Future<void> deleteExpenditureById(int id) async {
    try {
      await _databaseService.database.delete(
        DbSpec.T_EXPENDITURES,
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (err) {
      throw err;
    }
  }

  @override
  Future<List<Category>> getAllCategories() async {
    try {
      List<Map> categoriesResults =
          await _databaseService.database.query(DbSpec.T_CATEGORIES);
      return categoriesResults.map((c) => Category.fromJson(c)).toList();
    } catch (err) {
      throw err;
    }
  }

  @override
  Future<List<Expenditure>> getAllExpenditures() async {
    try {
      List<Map> expendituresResults = await _databaseService.database.rawQuery(
          "SELECT * FROM ${DbSpec.T_EXPENDITURES} ORDER BY expDate DESC");
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
          "SELECT * FROM ${DbSpec.T_EXPENDITURES} WHERE expDate >= '$startDate' AND expDate <= '$endDate ORDER BY expDate DESC'");
      return expendituresResults.map((c) => Expenditure.fromJson(c)).toList();
    } catch (err) {
      throw err;
    }
  }

  @override
  Future<List<Expenditure>> getLastExpenditures({int howMany}) async {
    try {
      List<Map> expendituresResults = await _databaseService.database.rawQuery(
          "SELECT * FROM ${DbSpec.T_EXPENDITURES} ORDER BY expDate DESC LIMIT $howMany");
      return expendituresResults.map((c) => Expenditure.fromJson(c)).toList();
    } catch (err) {
      throw err;
    }
  }

  @override
  Future<List<TotalMonthlyExpenses>> getTotalMonthlyExpensesInTimeSpan(
      DateTime start, DateTime end) async {
    try {
      String startDate = start.toIso8601String();
      String endDate = end.toIso8601String();

      List<Map> monthlyExpensesResults = await _databaseService.database.rawQuery(
          "SELECT SUM(moneyAmount) AS 'totalMoneyAmount', SUBSTR(expDate, 6, 2) AS 'name' FROM ${DbSpec.T_EXPENDITURES} WHERE expDate >= '$startDate' AND expDate <= '$endDate' GROUP BY 2 ORDER BY 2");
      return monthlyExpensesResults
          .map((c) => TotalMonthlyExpenses.fromJson(c))
          .toList();
    } catch (err) {
      throw err;
    }
  }

  @override
  Future<List<TotalCategoryExpenses>> getTotalCategoryExpensesInTimeSpan(
      DateTime start, DateTime end) async {
    try {
      String startDate = start.toIso8601String();
      String endDate = end.toIso8601String();

      List<Map> categoryExpensesResults = await _databaseService.database.rawQuery(
          "SELECT SUM(moneyAmount) AS 'totalMoneyAmount', catName AS 'name' FROM ${DbSpec.T_EXPENDITURES} e INNER JOIN ${DbSpec.T_CATEGORIES} c ON e.categoryId = c.id WHERE expDate >= '$startDate' AND expDate <= '$endDate' GROUP BY 2 ORDER BY 1");
      return categoryExpensesResults
          .map((c) => TotalCategoryExpenses.fromJson(c))
          .toList();
    } catch (err) {
      throw err;
    }
  }
}
