import 'package:currency_converter/src/domain/entities/currency.dart';
import 'package:currency_converter/src/features/currency_conversion/presentation/cubit/exchange/exchange_cubit.dart';

extension ExchangeStateExtension on ExchangeState {
  List<Currency>? get currenciesByState => maybeWhen(
        success: (currencies) => currencies,
        orElse: () => null,
      );

  List<Currency>? get fiatCurrencies => currenciesByState
      ?.where((currency) => currency.type == CurrencyType.fiat)
      .toList();

  List<Currency>? get cryptoCurrencies => currenciesByState
      ?.where((currency) => currency.type == CurrencyType.crypto)
      .toList();
}
