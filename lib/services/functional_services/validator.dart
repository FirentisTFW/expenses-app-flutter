class Validator {
  static String validateForDouble(String text) {
    assert(text != null);
    if (double.tryParse(text) != null) {
      return null;
    }
    return 'Enter a number';
  }

  static String vaidateForNonNegativeDouble(String text) {
    assert(text != null);
    if (validateForDouble(text) != null) {
      return 'Enter a number';
    } else if (double.tryParse(text) < 0) {
      return 'Enter a value that is >= 0';
    }
    return null;
  }

  static String validateForEmptyString(String text) {
    assert(text != null);
    if (text.isEmpty) {
      return 'This field can\'t be empty';
    }
    return null;
  }
}
