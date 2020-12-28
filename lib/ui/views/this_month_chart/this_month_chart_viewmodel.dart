import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/app/router.gr.dart';
import 'package:Expenses_app/datamodels/total_expenses.dart';
import 'package:Expenses_app/services/state_services/total_expenses_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ThisMonthChartViewModel extends BaseViewModel {
  final _totalExpensesService = locator<TotalExpensesService>();
  final _navigationService = locator<NavigationService>();
  List<TotalCategoryExpenses> data;

  Future fetchData() async {
    setBusy(true);
    data = await _totalExpensesService.getThisMonthCategoryExpenses();
    setBusy(false);
  }

  String getThisMonthTotalSpending() =>
      _totalExpensesService.getThisMonthTotalSpending().toStringAsFixed(2);

  Future goToNewExpenditureView() async => await _navigationService
      .navigateTo(Routes.newExpenditureView)
      .then((_) async => await fetchData());
  // fecth data after because new expenditure might have just been added

  Future goToNewCategoryView() async =>
      await _navigationService.navigateTo(Routes.newCategoryView);
}
