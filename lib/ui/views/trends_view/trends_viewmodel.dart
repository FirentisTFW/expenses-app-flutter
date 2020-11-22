import 'package:Expenses_app/services/functional_services/date_service.dart';
import 'package:stacked/stacked.dart';

class TrendsViewModel extends BaseViewModel {
  List<String> getMonthsForList() {
    return DateService.getMonthsWithYearsFrom(2019);
  }
}
