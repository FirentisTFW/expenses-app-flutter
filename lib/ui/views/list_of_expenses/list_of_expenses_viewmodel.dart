import 'package:Expenses_app/datamodels/expenditure.dart';
import 'package:stacked/stacked.dart';

class ListOfExpensesViewModel extends FutureViewModel<List<Expenditure>> {
  @override
  Future<List<Expenditure>> futureToRun() {
    print('Fetching expenses');
  }
}
