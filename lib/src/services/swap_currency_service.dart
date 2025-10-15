import 'package:currency_converter/src/domain/entities/conversion_rate.dart';

/// Interface for currency service operations
abstract class SwapCurrencyService {
  /// Get conversion rate between two currencies
  Future<ConversionRate> getConversionRate({
    required num type,
    required String cryptoCurrencyId,
    required String fiatCurrencyId,
    required double amount,
    required String amountCurrencyId,
  });
}
