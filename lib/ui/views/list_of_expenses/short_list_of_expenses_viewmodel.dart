import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/datamodels/expenditure.dart';
import 'package:Expenses_app/services/state_services/expenditures_service.dart';
import 'package:stacked/stacked.dart';

class ShortListOfExpensesViewModel extends FutureViewModel<List<Expenditure>> {
  final _expendituresService = locator<ExpendituresService>();

  @override
  Future<List<Expenditure>> futureToRun() =>
      _expendituresService.getLastExpenditures(5);
}
