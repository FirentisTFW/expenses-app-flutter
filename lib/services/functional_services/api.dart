import 'package:Expenses_app/datamodels/category.dart';
import 'package:Expenses_app/datamodels/expenditure.dart';

abstract class Api {
  // EXPENDITURES

  Future<List<Expenditure>> getAllExpenditures();

  Future<List<Expenditure>> getExpendituresInTimeSpan(
      DateTime start, DateTime end);

  Future<void> addExpenditure(Expenditure expenditure);

  // END - EXPENDITURES

  // CAEGORIES

  Future<List<Category>> getAllCategories();

  Future<void> addCategory(Category category);

  // END - CATEGORIES
}
