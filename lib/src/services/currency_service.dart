import 'package:currency_converter/src/domain/entities/currency.dart';

/// Interface for currency service operations
abstract class CurrencyService {
  /// Get all available currencies (fiat + crypto)
  Future<List<Currency>> getAllCurrencies();
}
