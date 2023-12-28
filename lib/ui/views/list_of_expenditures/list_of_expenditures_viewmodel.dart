import 'package:Expenses_app/app/locator.dart';
import 'package:Expenses_app/datamodels/enums/dialog_type.dart';
import 'package:Expenses_app/datamodels/enums/filtering_method.dart';
import 'package:Expenses_app/datamodels/expenditure.dart';
import 'package:Expenses_app/services/state_services/expenditures_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ListOfExpendituresViewModel extends BaseViewModel {
  final _expendituresService = locator<ExpendituresService>();
  final _snackbarService = locator<SnackbarService>();
  final _dialogService = locator<DialogService>();
  List<Expenditure> _expenditures = [];

  List<Expenditure> get expenditures => _expenditures;

  Future<void> fetchData() async {
    setBusy(true);
    try {
      _expenditures = await _expendituresService.getAllExpenditures();
    } catch (err) {
      setError(err);
    }
    setBusy(false);
  }

  Future<void> deleteExpenditureAndShowSnackbar(int id) async {
    var isDeleted = await deleteExpenditure(id);

    if (isDeleted) {
      notifyListeners();
      _snackbarService.showSnackbar(
          message: 'Expenditure deleted.', duration: Duration(seconds: 2));
    } else {
      setBusy(true);
      // I know this looks stupid but I found that this trick prevents Dismissable error
      await Future.delayed(Duration(seconds: 0), () => setBusy(false));
      _snackbarService.showSnackbar(
          message: 'Couldn\'t delete expenditure.',
          duration: Duration(seconds: 2));
    }
  }

  Future<bool> deleteExpenditure(int id) async {
    try {
      await _expendituresService.deleteExpenditureById(id);
      _expenditures.removeWhere((element) => element.id == id);
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<void> filterBy(FilteringMethod method) async {
    await delayIfBusy();

    if (method == FilteringMethod.ByPrice) {
      await showPriceFilterDialog();
    } else if (method == FilteringMethod.ByCategory) {
      await showCategoryFilterDialog();
    } else if (method == FilteringMethod.ByDate) {
      await showDateFilterDialog();
    }
    notifyListeners();
  }

  Future<void> delayIfBusy() async {
    while (isBusy) {
      await Future.delayed(Duration(seconds: 1));
    }
  }

  Future showPriceFilterDialog() async {
    var response = await _dialogService.showCustomDialog(
      title: 'Filter by price',
      mainButtonTitle: 'Filter',
      variant: DialogType.PriceFilter,
      barrierDismissible: true,
    );

    if (response != null && response.confirmed) {
      double minPrice = double.parse(response.responseData['min']);
      double maxPrice = double.parse(response.responseData['max']);

      _expenditures =
          _expendituresService.getExpendituresByPrice(minPrice, maxPrice);
    }
  }

  Future showCategoryFilterDialog() async {
    var response = await _dialogService.showCustomDialog(
      title: 'Filter by category',
      mainButtonTitle: 'Filter',
      variant: DialogType.CategoryFilter,
      barrierDismissible: true,
    );

    if (response != null && response.confirmed) {
      _expenditures = _expendituresService
          .getExpendituresByCategories(response.responseData);
    }
  }

  Future showDateFilterDialog() async {
    var response = await _dialogService.showCustomDialog(
      title: 'Filter by date',
      mainButtonTitle: 'Filter',
      variant: DialogType.DateFilter,
      barrierDismissible: true,
    );

    if (response?.responseData case final responseData?) {
      final startDate = responseData['startDate'] ?? null;
      final endDate = responseData['endDate'] ?? null;

      if (startDate != null && endDate != null) {
        _expenditures =
            _expendituresService.getExpendituresByDate(startDate, endDate);
      }
    }
  }
}
