import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/datamodels/enums/dialog_type.dart';
import 'package:Expenses_app/datamodels/enums/filtering_method.dart';
import 'package:Expenses_app/datamodels/expenditure.dart';
import 'package:Expenses_app/services/state_services/expenditures_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ListOfExpendituresViewModel extends FutureViewModel<List<Expenditure>> {
  final _expendituresService = locator<ExpendituresService>();
  final _dialogService = locator<DialogService>();

  @override
  Future<List<Expenditure>> futureToRun() =>
      _expendituresService.getAllExpenditures();

  void showFilteringOptions(FilteringMethod method) async {
    // print(method);

    await showCustomDialog();
  }

  Future showCustomDialog() async {
    var response = await _dialogService.showCustomDialog(
      title: 'My custom dialog',
      description: 'This is my dialog description',
      mainButtonTitle: 'Confirm',
      variant: DialogType.PriceFilter,
    );

    print('Custom response: ${response?.responseData}');
  }
}
