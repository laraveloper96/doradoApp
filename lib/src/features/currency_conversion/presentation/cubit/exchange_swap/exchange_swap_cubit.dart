import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:currency_converter/src/core/core.dart';
import 'package:currency_converter/src/domain/entities/currency.dart';
import 'package:currency_converter/src/features/currency_conversion/domain/extensions/exchange_swap_state_ext.dart';
import 'package:currency_converter/src/services/swap_currency_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_swap_cubit.freezed.dart';
part 'exchange_swap_state.dart';

class ExchangeSwapCubit extends Cubit<ExchangeSwapState> {
  ExchangeSwapCubit(
    SwapCurrencyService svc,
  )   : _svc = svc,
        super(const ExchangeSwapState.initial());

  final SwapCurrencyService _svc;

  double _amount = 10;
  double _rate = 0;

  Currency? get selectedFiat => state.selectedFiatByState;
  Currency? get selectedCrypto => state.selectedCryptoByState;
  bool get hasCrypto => state.hasCrypto;
  double get convertedAmount => state.convertedAmount;
  double get amount => _amount;
  double get rate => _rate;
  double _convertCurrency(bool hasCrypto) => hasCrypto
      ? _rate > 0
          ? amount / _rate // CRYPTO to FIAT
          : 0.0
      : amount * _rate; // FIAT to CRYPTO

  bool get canSwap => selectedFiat != null && selectedCrypto != null;

  Future<void> loadCurrencies({
    Currency? fiatCurrency,
    Currency? cryptoCurrency,
  }) async {
    if (fiatCurrency != null && cryptoCurrency != null) {
      emit(
        ExchangeSwapState.loadedCurrencies(
          selectedFiat: fiatCurrency,
          selectedCrypto: cryptoCurrency,
        ),
      );
      unawaited(_swapCurrencies());
    }
  }

  /// Select fiat currency
  void selectFiatCurrency(Currency currency) {
    if (selectedCrypto != null) {
      emit(
        ExchangeSwapState.selectFiat(
          hasCrypto: state.hasCrypto,
          validationState:
              const ValidationState.success(type: ValidationType.select),
          convertedAmount: convertedAmount,
          selectedFiat: currency,
          selectedCrypto: selectedCrypto!,
        ),
      );
      unawaited(_swapCurrencies());
    }
  }

  /// Select crypto currency
  void selectCryptoCurrency(Currency currency) {
    if (selectedFiat != null) {
      emit(
        ExchangeSwapState.selectCrypto(
          hasCrypto: state.hasCrypto,
          validationState:
              const ValidationState.success(type: ValidationType.select),
          convertedAmount: convertedAmount,
          selectedFiat: selectedFiat!,
          selectedCrypto: currency,
        ),
      );
      unawaited(_swapCurrencies());
    }
  }

  Future<void> swap() async {
    if (!canSwap) {
      return;
    }
    final newHasCrypto = !hasCrypto;
    emit(
      ExchangeSwapState.swap(
        hasCrypto: newHasCrypto,
        validationState:
            const ValidationState.success(type: ValidationType.swap),
        convertedAmount: _convertCurrency(newHasCrypto),
        selectedFiat: selectedFiat!,
        selectedCrypto: selectedCrypto!,
      ),
    );
  }

  /// Swap currencies
  Future<void> _swapCurrencies() async {
    try {
      final result = await _svc.getConversionRate(
        type: state.hasCrypto ? 0 : 1,
        cryptoCurrencyId: selectedCrypto?.code ?? '',
        fiatCurrencyId: selectedFiat?.code ?? '',
        amount: amount,
        amountCurrencyId: state.hasCrypto
            ? selectedCrypto?.code ?? ''
            : selectedFiat?.code ?? '',
      );

      final rate = result.rate;
      _rate = rate;

      if (rate <= 0) {
        emit(
          ExchangeSwapState.swap(
            hasCrypto: hasCrypto,
            validationState: const ValidationState.error(
              error: ValidationException('No se encontrar ninguna conversión'),
            ),
            convertedAmount: 0,
            selectedFiat: selectedFiat!,
            selectedCrypto: selectedCrypto!,
          ),
        );
        return;
      }

      emit(
        ExchangeSwapState.swap(
          hasCrypto: hasCrypto,
          validationState:
              const ValidationState.success(type: ValidationType.swap),
          convertedAmount: _convertCurrency(hasCrypto),
          selectedFiat: selectedFiat!,
          selectedCrypto: selectedCrypto!,
        ),
      );
    } on AppException catch (error) {
      emit(
        ExchangeSwapState.swap(
          hasCrypto: hasCrypto,
          validationState: ValidationState.error(error: error),
          convertedAmount: 0,
          selectedFiat: selectedFiat!,
          selectedCrypto: selectedCrypto!,
        ),
      );
    } catch (error) {
      emit(
        ExchangeSwapState.swap(
          hasCrypto: hasCrypto,
          validationState: const ValidationState.error(
            error: UnexpectedException('No se pudo realizar la conversión'),
          ),
          convertedAmount: 0,
          selectedFiat: selectedFiat!,
          selectedCrypto: selectedCrypto!,
        ),
      );
    }
  }

  void updateAmount(double amount) {
    _amount = amount;
    if (!canSwap) {
      return;
    }

    if (_rate <= 0) {
      _swapCurrencies();
      return;
    }

    emit(
      ExchangeSwapState.swap(
        hasCrypto: hasCrypto,
        validationState:
            const ValidationState.success(type: ValidationType.swap),
        convertedAmount: _convertCurrency(hasCrypto),
        selectedFiat: selectedFiat!,
        selectedCrypto: selectedCrypto!,
      ),
    );
  }
}
