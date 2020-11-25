import 'package:Expenses_app/datamodels/expenditure.dart';
import 'package:Expenses_app/datamodels/category.dart';
import 'package:Expenses_app/datamodels/total_monthly_expenses.dart';
import 'package:Expenses_app/services/functional_services/api.dart';

class FakeApi extends Api {
  @override
  Future<void> addCategory(Category category) async {
    // TODO: implement addCategory
    throw UnimplementedError();
  }

  @override
  Future<void> addExpenditure(Expenditure expenditure) async {
    // TODO: implement addExpenditure
    throw UnimplementedError();
  }

  @override
  Future<List<Category>> getAllCategories() async {
    await delayRequest();
    return [
      Category(id: 0, iconId: 0, name: 'Accomodation'),
      Category(id: 1, iconId: 1, name: 'Alcohol'),
      Category(id: 2, iconId: 2, name: 'Bills'),
      Category(id: 3, iconId: 3, name: 'Books'),
      Category(id: 4, iconId: 4, name: 'Car'),
      Category(id: 5, iconId: 5, name: 'Cigarettes'),
      Category(id: 6, iconId: 6, name: 'Clothes'),
      Category(id: 7, iconId: 7, name: 'Debt'),
      Category(id: 8, iconId: 8, name: 'Eating out'),
      Category(id: 9, iconId: 9, name: 'Education'),
      Category(id: 10, iconId: 10, name: 'Electronics'),
      Category(id: 11, iconId: 11, name: 'Entertainment'),
      Category(id: 12, iconId: 12, name: 'Gifts'),
      Category(id: 13, iconId: 13, name: 'Groceries'),
      Category(id: 14, iconId: 14, name: 'Health care'),
      Category(id: 15, iconId: 15, name: 'Hygiene'),
      Category(id: 16, iconId: 16, name: 'Other'),
      Category(id: 17, iconId: 17, name: 'Transport'),
      Category(id: 18, iconId: 18, name: 'Sport'),
    ];
  }

  @override
  Future<List<Expenditure>> getAllExpenditures() async {
    await delayRequest();
    return [
      Expenditure(
          id: 0,
          categoryId: 0,
          name: "Rent",
          moneyAmount: 1600.0,
          date: DateTime(2020, 08, 10)),
      Expenditure(
          id: 1,
          categoryId: 2,
          moneyAmount: 180.00,
          name: "Utilities",
          date: DateTime(2020, 08, 11)),
      Expenditure(
          id: 2,
          categoryId: 13,
          moneyAmount: 69.76,
          name: "Weekly Groceries",
          date: DateTime(2020, 08, 12)),
      Expenditure(
          id: 3,
          categoryId: 8,
          moneyAmount: 19.99,
          name: "Pizza with friends",
          date: DateTime(2020, 08, 14)),
      Expenditure(
          id: 4,
          categoryId: 15,
          moneyAmount: 29.99,
          name: "Cleaning supplies",
          date: DateTime(2020, 08, 12)),
      Expenditure(
          id: 5,
          categoryId: 17,
          moneyAmount: 59.99,
          name: "Monthly bus ticket",
          date: DateTime(2020, 08, 13)),
      Expenditure(
          id: 6,
          categoryId: 6,
          moneyAmount: 71.04,
          name: "T-shirts",
          date: DateTime(2020, 08, 13)),
      Expenditure(
          id: 7,
          categoryId: 12,
          moneyAmount: 103.26,
          name: "Mom's birthday gifts",
          date: DateTime(2020, 08, 14)),
      Expenditure(
          id: 8,
          categoryId: 3,
          moneyAmount: 10.99,
          name: "Book - SQL",
          date: DateTime(2020, 08, 14)),
      Expenditure(
          id: 9,
          categoryId: 18,
          moneyAmount: 99.99,
          name: "Gym membership",
          date: DateTime(2020, 08, 15)),
      Expenditure(
          id: 10,
          categoryId: 11,
          moneyAmount: 10.99,
          name: "Cinema",
          date: DateTime(2020, 08, 16)),
      Expenditure(
          id: 11,
          categoryId: 8,
          moneyAmount: 11.60,
          name: "Spaghetti",
          date: DateTime(2020, 08, 16)),
      Expenditure(
          id: 12,
          categoryId: 12,
          moneyAmount: 43.67,
          name: "Groceries",
          date: DateTime(2020, 08, 17)),
      Expenditure(
          id: 13,
          categoryId: 17,
          moneyAmount: 11.88,
          name: "Uber",
          date: DateTime(2020, 08, 18)),
      Expenditure(
          id: 14,
          categoryId: 0,
          name: "Rent",
          moneyAmount: 1600.0,
          date: DateTime(2020, 09, 10)),
      Expenditure(
          id: 15,
          categoryId: 2,
          moneyAmount: 180.00,
          name: "Utilities",
          date: DateTime(2020, 09, 11)),
      Expenditure(
          id: 16,
          categoryId: 13,
          moneyAmount: 69.76,
          name: "Weekly Groceries",
          date: DateTime(2020, 09, 22)),
      Expenditure(
          id: 17,
          categoryId: 8,
          moneyAmount: 19.99,
          name: "Pizza with friends",
          date: DateTime(2020, 09, 24)),
      Expenditure(
          id: 18,
          categoryId: 15,
          moneyAmount: 29.99,
          name: "Cleaning supplies",
          date: DateTime(2020, 09, 22)),
      Expenditure(
          id: 19,
          categoryId: 17,
          moneyAmount: 59.99,
          name: "Monthly bus ticket",
          date: DateTime(2020, 09, 23)),
      Expenditure(
          id: 20,
          categoryId: 6,
          moneyAmount: 71.04,
          name: "T-shirts",
          date: DateTime(2020, 09, 23)),
      Expenditure(
          id: 21,
          categoryId: 12,
          moneyAmount: 103.26,
          name: "Mom's birthday gifts",
          date: DateTime(2020, 09, 24)),
      Expenditure(
          id: 22,
          categoryId: 3,
          moneyAmount: 22.99,
          name: "Book - Spanish",
          date: DateTime(2020, 09, 24)),
      Expenditure(
          id: 23,
          categoryId: 18,
          moneyAmount: 99.99,
          name: "Gym membership",
          date: DateTime(2020, 09, 25)),
      Expenditure(
          id: 24,
          categoryId: 11,
          moneyAmount: 10.99,
          name: "Cinema",
          date: DateTime(2020, 09, 26)),
      Expenditure(
          id: 25,
          categoryId: 8,
          moneyAmount: 11.60,
          name: "Spaghetti",
          date: DateTime(2020, 09, 26)),
      Expenditure(
          id: 26,
          categoryId: 13,
          moneyAmount: 43.67,
          name: "Groceries",
          date: DateTime(2020, 09, 27)),
      Expenditure(
          id: 27,
          categoryId: 17,
          moneyAmount: 11.88,
          name: "Uber",
          date: DateTime(2020, 09, 28)),
      Expenditure(
          id: 28,
          categoryId: 13,
          moneyAmount: 69.76,
          name: "Weekly Groceries",
          date: DateTime(2020, 10, 2)),
      Expenditure(
          id: 29,
          categoryId: 8,
          moneyAmount: 19.99,
          name: "Pizza with friends",
          date: DateTime(2020, 10, 4)),
      Expenditure(
          id: 30,
          categoryId: 15,
          moneyAmount: 29.99,
          name: "Cleaning supplies",
          date: DateTime(2020, 10, 2)),
      Expenditure(
          id: 31,
          categoryId: 17,
          moneyAmount: 59.99,
          name: "Monthly bus ticket",
          date: DateTime(2020, 10, 3)),
      Expenditure(
          id: 32,
          categoryId: 6,
          moneyAmount: 71.04,
          name: "T-shirts",
          date: DateTime(2020, 10, 3)),
      Expenditure(
          id: 33,
          categoryId: 12,
          moneyAmount: 97.43,
          name: "Dad's birthday gifts",
          date: DateTime(2020, 10, 4)),
      Expenditure(
          id: 34,
          categoryId: 3,
          moneyAmount: 10.99,
          name: "Book",
          date: DateTime(2020, 10, 4)),
      Expenditure(
          id: 35,
          categoryId: 18,
          moneyAmount: 99.99,
          name: "Gym membership",
          date: DateTime(2020, 10, 5)),
      Expenditure(
          id: 36,
          categoryId: 11,
          moneyAmount: 10.99,
          name: "Cinema",
          date: DateTime(2020, 10, 6)),
      Expenditure(
          id: 37,
          categoryId: 8,
          moneyAmount: 11.60,
          name: "Spaghetti",
          date: DateTime(2020, 10, 6)),
      Expenditure(
          id: 38,
          categoryId: 13,
          moneyAmount: 43.67,
          name: "Groceries",
          date: DateTime(2020, 10, 7)),
      Expenditure(
          id: 39,
          categoryId: 17,
          moneyAmount: 11.88,
          name: "Uber",
          date: DateTime(2020, 10, 8)),
    ];
  }

  @override
  Future<List<Expenditure>> getExpendituresInTimeSpan(
      DateTime start, DateTime end) async {
    await delayRequest();
    return [
      Expenditure(
          id: 2,
          categoryId: 13,
          moneyAmount: 69.76,
          name: "Weekly Groceries",
          date: DateTime(2020, 10, 12)),
      Expenditure(
          id: 3,
          categoryId: 8,
          moneyAmount: 19.99,
          name: "Pizza with friends",
          date: DateTime(2020, 10, 14)),
      Expenditure(
          id: 4,
          categoryId: 15,
          moneyAmount: 29.99,
          name: "Cleaning supplies",
          date: DateTime(2020, 10, 12)),
      Expenditure(
          id: 5,
          categoryId: 17,
          moneyAmount: 59.99,
          name: "Monthly bus ticket",
          date: DateTime(2020, 10, 13)),
      Expenditure(
          id: 6,
          categoryId: 6,
          moneyAmount: 71.04,
          name: "T-shirts",
          date: DateTime(2020, 10, 13)),
      Expenditure(
          id: 7,
          categoryId: 12,
          moneyAmount: 103.26,
          name: "Mom's birthday gifts",
          date: DateTime(2020, 10, 14)),
      Expenditure(
          id: 8,
          categoryId: 3,
          moneyAmount: 10.99,
          name: "Book - SQL",
          date: DateTime(2020, 10, 14)),
      Expenditure(
          id: 9,
          categoryId: 18,
          moneyAmount: 99.99,
          name: "Gym membership",
          date: DateTime(2020, 10, 15)),
      Expenditure(
          id: 10,
          categoryId: 11,
          moneyAmount: 10.99,
          name: "Cinema",
          date: DateTime(2020, 10, 16)),
      Expenditure(
          id: 11,
          categoryId: 8,
          moneyAmount: 11.60,
          name: "Spaghetti",
          date: DateTime(2020, 10, 16)),
    ];
  }

  @override
  Future<List<Expenditure>> getLastExpenditures({int howMany}) async {
    await delayRequest();
    return [
      Expenditure(
          id: 2,
          categoryId: 13,
          moneyAmount: 69.76,
          name: "Weekly Groceries",
          date: DateTime(2020, 10, 12)),
      Expenditure(
          id: 3,
          categoryId: 8,
          moneyAmount: 19.99,
          name: "Pizza with friends",
          date: DateTime(2020, 10, 14)),
      Expenditure(
          id: 4,
          categoryId: 15,
          moneyAmount: 29.99,
          name: "Cleaning supplies",
          date: DateTime(2020, 10, 12)),
      Expenditure(
          id: 5,
          categoryId: 17,
          moneyAmount: 59.99,
          name: "Monthly bus ticket",
          date: DateTime(2020, 10, 13)),
      Expenditure(
          id: 6,
          categoryId: 6,
          moneyAmount: 71.04,
          name: "T-shirts",
          date: DateTime(2020, 10, 13)),
      Expenditure(
          id: 7,
          categoryId: 12,
          moneyAmount: 103.26,
          name: "Mom's birthday gifts",
          date: DateTime(2020, 10, 14)),
      Expenditure(
          id: 8,
          categoryId: 3,
          moneyAmount: 10.99,
          name: "Book - SQL",
          date: DateTime(2020, 10, 14)),
      Expenditure(
          id: 9,
          categoryId: 18,
          moneyAmount: 99.99,
          name: "Gym membership",
          date: DateTime(2020, 10, 15)),
      Expenditure(
          id: 10,
          categoryId: 11,
          moneyAmount: 10.99,
          name: "Cinema",
          date: DateTime(2020, 10, 16)),
      Expenditure(
          id: 11,
          categoryId: 8,
          moneyAmount: 11.60,
          name: "Spaghetti",
          date: DateTime(2020, 10, 16)),
    ];
  }

  @override
  Future<List<TotalMonthlyExpenses>> getMonthlyTotalExpensesInLastMonths(
      int howManyMonths) async {
    await delayRequest();
    return [
      TotalMonthlyExpenses(
        name: '8',
        totalMoneyAmount: 2464,
      ),
      TotalMonthlyExpenses(
        name: '9',
        totalMoneyAmount: 2122,
      ),
      TotalMonthlyExpenses(
        name: '10',
        totalMoneyAmount: 1977,
      ),
      TotalMonthlyExpenses(
        name: '11',
        totalMoneyAmount: 2683,
      ),
    ];
  }

  @override
  Future<List<TotalMonthlyExpenses>> getTotalMonthlyExpensesInTimeSpan(
      DateTime start, DateTime end) async {
    await delayRequest();
    return [
      TotalMonthlyExpenses(
        name: '6',
        totalMoneyAmount: 1998,
      ),
      TotalMonthlyExpenses(
        name: '7',
        totalMoneyAmount: 2344,
      ),
      TotalMonthlyExpenses(
        name: '8',
        totalMoneyAmount: 2333,
      ),
      TotalMonthlyExpenses(
        name: '9',
        totalMoneyAmount: 2122,
      ),
      TotalMonthlyExpenses(
        name: '10',
        totalMoneyAmount: 1887,
      ),
      TotalMonthlyExpenses(
        name: '11',
        totalMoneyAmount: 2485,
      ),
    ];
  }

  @override
  Future<List<TotalCategoryExpenses>> getTotalCategoryExpensesInTimeSpan(
      DateTime start, DateTime end) {}

  Future<void> delayRequest() async {
    await Future.delayed(Duration(seconds: 1));
  }
}
