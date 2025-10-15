import 'package:flutter/widgets.dart';

extension AppLocalizationsX on BuildContext {
  // Temporary implementation until flutter_gen files are generated
  AppLocalizations get l10n => AppLocalizations.of(this);
}

// Temporary AppLocalizations class
class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return AppLocalizations();
  }
  
  String get iHave => 'TENGO';
  String get iWant => 'QUIERO';
  String get exchange => 'Cambiar';
  String get fiat => 'FIAT';
  String get crypto => 'CRYPTO';
}