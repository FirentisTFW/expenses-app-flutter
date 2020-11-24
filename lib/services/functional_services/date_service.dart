class DateService {
  static List<DateTime> getMonthsWithYearsFrom(int startingYear) {
    List<DateTime> monthsList = [];

    final currentYear = DateTime.now().year;
    final currentMonth = DateTime.now().month;
    for (int y = startingYear; y <= currentYear; y++) {
      for (int m = 1; m <= (y < currentYear ? 12 : currentMonth); m++) {
        monthsList.add(DateTime(y, m));
      }
    }

    return monthsList.reversed.toList();
  }

  static DateTime setToLastDayOfTheMonth(DateTime date) {
    var nextMonth = DateTime(date.month < 12 ? date.year : date.year + 1,
        date.month < 12 ? date.month + 1 : 1);
    return nextMonth.subtract(Duration(microseconds: 1));
  }
}
