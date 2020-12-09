import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/app/router.gr.dart';
import 'package:Expenses_app/datamodels/expenditure.dart';
import 'package:Expenses_app/services/state_services/expenditures_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ShortListOfExpensesViewModel extends FutureViewModel<List<Expenditure>> {
  final _expendituresService = locator<ExpendituresService>();
  final _navigationService = locator<NavigationService>();

  @override
  Future<List<Expenditure>> futureToRun() =>
      _expendituresService.getLastExpenditures(5);

  Future goToListOfExpensesView() async {
    await _navigationService.navigateTo(Routes.listOfExpendituresView);
  }
}
