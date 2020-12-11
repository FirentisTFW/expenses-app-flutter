import 'package:Expenses_app/services/functional_services/date_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DateServiceTest -', () {
    group('getLastDayOfTheMonth -', () {
      test('Works given first day of the month on non-leap years', () {
        expect(DateService.getLastDayOfTheMonth(DateTime(2021, 01, 01)),
            DateTime(2021, 01, 31, 23, 59, 59, 999));
        expect(DateService.getLastDayOfTheMonth(DateTime(2021, 02, 01)),
            DateTime(2021, 02, 28, 23, 59, 59, 999));
        expect(DateService.getLastDayOfTheMonth(DateTime(2021, 03, 01)),
            DateTime(2021, 03, 31, 23, 59, 59, 999));
        expect(DateService.getLastDayOfTheMonth(DateTime(2021, 04, 01)),
            DateTime(2021, 04, 30, 23, 59, 59, 999));
        expect(DateService.getLastDayOfTheMonth(DateTime(2021, 05, 01)),
            DateTime(2021, 05, 31, 23, 59, 59, 999));
        expect(DateService.getLastDayOfTheMonth(DateTime(2021, 06, 01)),
            DateTime(2021, 06, 30, 23, 59, 59, 999));
      });
      test('Works given last day of the month on non-leap years', () {
        expect(DateService.getLastDayOfTheMonth(DateTime(2021, 07, 31)),
            DateTime(2021, 07, 31, 23, 59, 59, 999));
        expect(DateService.getLastDayOfTheMonth(DateTime(2021, 08, 31)),
            DateTime(2021, 08, 31, 23, 59, 59, 999));
        expect(DateService.getLastDayOfTheMonth(DateTime(2021, 09, 30)),
            DateTime(2021, 09, 30, 23, 59, 59, 999));
        expect(DateService.getLastDayOfTheMonth(DateTime(2021, 10, 31)),
            DateTime(2021, 10, 31, 23, 59, 59, 999));
        expect(DateService.getLastDayOfTheMonth(DateTime(2021, 11, 30)),
            DateTime(2021, 11, 30, 23, 59, 59, 999));
        expect(DateService.getLastDayOfTheMonth(DateTime(2021, 12, 31)),
            DateTime(2021, 12, 31, 23, 59, 59, 999));
      });
      test('February works on leap years', () {
        expect(DateService.getLastDayOfTheMonth(DateTime(2020, 02, 01)),
            DateTime(2020, 02, 29, 23, 59, 59, 999));
        expect(DateService.getLastDayOfTheMonth(DateTime(2020, 02, 28)),
            DateTime(2020, 02, 29, 23, 59, 59, 999));
      });
    });
  });
}
