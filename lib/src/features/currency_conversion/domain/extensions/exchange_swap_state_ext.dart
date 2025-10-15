import 'package:currency_converter/src/domain/entities/currency.dart';
import 'package:currency_converter/src/features/currency_conversion/presentation/cubit/exchange_swap/exchange_swap_cubit.dart';

extension ExchangeSwapStateExtension on ExchangeSwapState {
  Currency? get selectedFiatByState => maybeWhen(
        loadedCurrencies: (selectedFiat, __, ___, ____) => selectedFiat,
        selectFiat: (_, __, ___, selectedFiat, ____) => selectedFiat,
        selectCrypto: (_, __, ___, selectedFiat, ____) => selectedFiat,
        swap: (_, __, ___, selectedFiat, ____) => selectedFiat,
        orElse: () => null,
      );

  Currency? get selectedCryptoByState => maybeWhen(
        loadedCurrencies: (_, selectedCrypto, ___, ____) => selectedCrypto,
        selectFiat: (_, __, ___, ____, selectedCrypto) => selectedCrypto,
        selectCrypto: (_, __, ___, ____, selectedCrypto) => selectedCrypto,
        swap: (_, __, ___, ____, selectedCrypto) => selectedCrypto,
        orElse: () => null,
      );

  bool get hasCrypto => maybeWhen(
        loadedCurrencies: (_, __, hasCrypto, ____) => hasCrypto,
        selectFiat: (hasCrypto, __, ___, ____, _____) => hasCrypto,
        selectCrypto: (hasCrypto, __, ___, ____, _____) => hasCrypto,
        swap: (hasCrypto, __, ___, ____, _____) => hasCrypto,
        orElse: () => false,
      );

  double get convertedAmount => maybeWhen(
        swap: (_, __, convertedAmount, ____, ___) => convertedAmount,
        selectFiat: (_, __, convertedAmount, ____, ___) => convertedAmount,
        selectCrypto: (_, __, convertedAmount, ____, ___) => convertedAmount,
        orElse: () => 0.0,
      );
}
