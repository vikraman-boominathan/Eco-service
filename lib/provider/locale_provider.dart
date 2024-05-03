import 'package:flutter/material.dart';

class LocaleNotifier extends ChangeNotifier {
  Locale _locale = Locale('es');

  Locale get locale => _locale;

   void toggleLocale() {
    _locale = _locale.languageCode == 'en' ? Locale('es') : Locale('en');
    notifyListeners();
  }
}
