import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/app/router.gr.dart';
import 'package:Expenses_app/datamodels/expenditure.dart';
import 'package:Expenses_app/services/state_services/expenditures_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ShortListOfExpensesViewModel extends BaseViewModel {
  final _expendituresService = locator<ExpendituresService>();
  final _navigationService = locator<NavigationService>();
  List<Expenditure> data;

  Future fetchData() async {
    setBusy(true);
    data = await _expendituresService.getLastExpenditures(7);
    setBusy(false);
  }

  Future goToListOfExpensesView() async => await _navigationService
      .navigateTo(Routes.listOfExpendituresView)
      .then((_) async => await fetchData());
  // fecth data after because some expenditures might just have been deleted
}
