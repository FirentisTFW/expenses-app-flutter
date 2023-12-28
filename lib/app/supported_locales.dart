import 'package:flutter/cupertino.dart';

abstract final class AppLocales {
  const AppLocales._();

  static const Locale _english = Locale.fromSubtags(
    countryCode: 'EN',
    languageCode: 'en',
  );
  static const Locale _polish = Locale.fromSubtags(
    countryCode: 'PL',
    languageCode: 'pl',
  );

  static List<Locale> get supportedLocales => [_english, _polish];
}
