import 'package:stacked/stacked.dart';

class ThisMonthChartViewModel extends FutureViewModel {
  @override
  Future futureToRun() {
    print('Fetching expenses and creating chart');
  }
}
