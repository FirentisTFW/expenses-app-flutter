import 'package:stacked/stacked.dart';

class DateFilterDialogViewModel extends BaseViewModel {
  DateTime _startDate;
  DateTime _endDate;

  DateTime get startDate => _startDate;
  DateTime get endDate => _endDate;

  void setStartDate(value) {
    _startDate = value;
    notifyListeners();
  }

  void setEndDate(value) {
    _endDate = value;
    notifyListeners();
  }
}
