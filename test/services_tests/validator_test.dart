import 'package:Expenses_app/services/functional_services/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ValidatorTest -', () {
    group('validateForDouble -', () {
      test('Given value with two decimal places, returns null', () {
        expect(Validator.validateForDouble('1.11'), null);
        expect(Validator.validateForDouble('22.22'), null);
      });
      test('Given value with no decimalpoints, returns null', () {
        expect(Validator.validateForDouble('1'), null);
        expect(Validator.validateForDouble('22'), null);
      });
      test('Given incorrect value, returns hint message', () {
        expect(Validator.validateForDouble('incorrect'), 'Enter a number');
      });
    });
  });
}
