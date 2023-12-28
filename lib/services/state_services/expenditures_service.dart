import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/datamodels/expenditure.dart';
import 'package:Expenses_app/services/functional_services/database_services/api.dart';

class ExpendituresService {
  final _api = locator<Api>();

  List<Expenditure> _expenditures = [];
  List<Expenditure> get expenditures => _expenditures;

  Future addExpenditure(Expenditure expenditure) async =>
      await _api.addExpenditure(expenditure);

  Future deleteExpenditureById(int id) async =>
      await _api.deleteExpenditureById(id);

  Future<List<Expenditure>> getLastExpenditures(int howMany) async {
    _expenditures = await _api.getLastExpenditures(howMany: howMany);
    return _expenditures;
  }

  Future<List<Expenditure>> getAllExpenditures() async {
    _expenditures = await _api.getAllExpenditures();
    return _expenditures;
  }

  List<Expenditure> getExpendituresByPrice(double minPrice, double maxPrice) =>
      _expenditures
          .where((element) =>
              element.moneyAmount >= minPrice &&
              element.moneyAmount <= maxPrice)
          .toList();

  List<Expenditure> getExpendituresByCategories(List<int> categoriesIds) =>
      _expenditures
          .where((element) => categoriesIds.contains(element.categoryId))
          .toList();

  List<Expenditure> getExpendituresByDate(
          DateTime startDate, DateTime endDate) =>
      _expenditures
          .where((element) =>
              (element.date.isAfter(startDate) &&
                  element.date.isBefore(endDate)) ||
              element.date.isAtSameMomentAs(startDate) ||
              element.date.isAtSameMomentAs(endDate))
          .toList();
}
