// FIXME Localize

abstract final class Validator {
  const Validator._();

  static String? validateForDouble(String? text) {
    if (double.tryParse(text ?? '') != null) {
      return null;
    }
    return 'Enter a number';
  }

  static String? vaidateForNonNegativeDouble(String? text) {
    if (validateForDouble(text) != null) {
      return 'Enter a number';
    } else if (double.parse(text ?? '') < 0) {
      return 'Enter a value that is >= 0';
    }
    return null;
  }

  static String? validateForEmptyString(String? text) {
    if (text?.isEmpty ?? true) {
      return 'This field can\'t be empty';
    }
    return null;
  }
}
