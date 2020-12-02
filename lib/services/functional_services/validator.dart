class Validator {
  static String validateForDouble(String text) {
    if (double.tryParse(text) != null) {
      return null;
    }
    return 'Enter a number';
  }
}
