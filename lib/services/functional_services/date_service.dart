import 'package:intl/intl.dart';

class DateService {
  static List<String> getMonthsWithYearsFrom(int startingYear) {
    List<String> monthsList = [];

    final currentYear = DateTime.now().year;
    final currentMonth = DateTime.now().month;
    for (int y = startingYear; y <= currentYear; y++) {
      for (int m = 1; m <= (y < currentYear ? 12 : currentMonth); m++) {
        monthsList.add(DateFormat.yMMMM().format(DateTime(y, m)));
      }
    }

    return monthsList.reversed.toList();
  }
}
