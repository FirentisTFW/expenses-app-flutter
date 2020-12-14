import 'package:Expenses_app/services/functional_services/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ValidatorTest -', () {
    group('validateForDouble -', () {
      test('Given value with two decimal places, returns null', () {
        expect(Validator.validateForDouble('1.11'), null);
        expect(Validator.validateForDouble('22.22'), null);
      });
      test('Given value with no decimal places, returns null', () {
        expect(Validator.validateForDouble('1'), null);
        expect(Validator.validateForDouble('22'), null);
      });
      test('Given incorrect value, returns hint message', () {
        expect(Validator.validateForDouble('incorrect'), isA<String>());
      });
      test('Given negative correct value with two decimal places, returns null',
          () {
        expect(Validator.validateForDouble('-11.22'), null);
      });
      test('Given negative correct value with no decimal places, returns null',
          () {
        expect(Validator.validateForDouble('-11'), null);
      });
    });
    group('vaidateForNonNegativeDouble -', () {
      test('Given value < 0 with two decimal places, returns hint message', () {
        expect(Validator.vaidateForNonNegativeDouble('-1.22'), isA<String>());
      });
      test('Given value < 0 with no decimal places, returns hint message', () {
        expect(Validator.vaidateForNonNegativeDouble('-1'), isA<String>());
      });
      test('Given value < 0 and close to 0, returns hint message', () {
        expect(Validator.vaidateForNonNegativeDouble('-0.001'), isA<String>());
      });
      test('Given 0, returns null', () {
        expect(Validator.vaidateForNonNegativeDouble('0'), null);
      });
      test('Given value > 0, returns null', () {
        expect(Validator.vaidateForNonNegativeDouble('1'), null);
      });
    });
  });
}
