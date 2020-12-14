class Validator {
  static String validateForDouble(String text) {
    if (double.tryParse(text) != null) {
      return null;
    }
    return 'Enter a number';
  }

  static String vaidateForNonNegativeDouble(String text) {
    if (validateForDouble(text) != null) {
      return 'Enter a number';
    } else if (double.tryParse(text) < 0) {
      return 'Enter a value that is >= 0';
    }
    return null;
  }
}
