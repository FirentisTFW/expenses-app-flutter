import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/datamodels/enums/dialog_type.dart';
import 'package:Expenses_app/datamodels/enums/filtering_method.dart';
import 'package:Expenses_app/datamodels/expenditure.dart';
import 'package:Expenses_app/services/state_services/expenditures_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ListOfExpendituresViewModel extends BaseViewModel {
  final _expendituresService = locator<ExpendituresService>();
  final _dialogService = locator<DialogService>();
  List<Expenditure> _expenditures;

  List<Expenditure> get expenditures => _expenditures;

  Future<void> fetchData() async {
    setBusy(true);
    _expenditures = await _expendituresService.getAllExpenditures();
    setBusy(false);
  }

  Future<void> filterBy(FilteringMethod method) async {
    await delayIfBusy();

    if (method == FilteringMethod.ByPrice) {
      await showPriceFilterDialog();
    }
    notifyListeners();
  }

  Future<void> delayIfBusy() async {
    while (isBusy) {
      await Future.delayed(Duration(seconds: 1));
    }
  }

  Future showPriceFilterDialog() async {
    print('lala');
    var response = await _dialogService.showCustomDialog(
      title: 'Filter by price',
      mainButtonTitle: 'Filter',
      variant: DialogType.PriceFilter,
      barrierDismissible: true,
    );

    if (response != null && response.confirmed) {
      print(response.responseData['min']);
      print(double.parse(response.responseData['min']));

      double minPrice = double.parse(response.responseData['min']);
      double maxPrice = double.parse(response.responseData['max']);

      _expenditures =
          _expendituresService.getExpendituresByPrice(minPrice, maxPrice);
    }
  }
}
