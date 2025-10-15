part of 'exchange_swap_cubit.dart';

/// States for exchange functionality
@freezed
sealed class ExchangeSwapState with _$ExchangeSwapState {
  /// Initial state
  const factory ExchangeSwapState.initial() = _Initial;

  /// SelectFiat state with selected fiat currency
  const factory ExchangeSwapState.loadedCurrencies({
    required Currency selectedFiat,
    required Currency selectedCrypto,
    @Default(true) bool hasCrypto,
    @Default(0) double convertedAmount,
  }) = _LoadedCurrencies;

  /// SelectFiat state with selected fiat currency
  const factory ExchangeSwapState.selectFiat({
    required bool hasCrypto,
    required ValidationState validationState,
    required double convertedAmount,
    required Currency selectedFiat,
    required Currency selectedCrypto,
  }) = _SelectFiat;

  /// SelectCrypto state with selected crypto currency
  const factory ExchangeSwapState.selectCrypto({
    required bool hasCrypto,
    required ValidationState validationState,
    required double convertedAmount,
    required Currency selectedFiat,
    required Currency selectedCrypto,
  }) = _SelectCrypto;

  /// Swap state with selected fiat and crypto currencies
  const factory ExchangeSwapState.swap({
    required bool hasCrypto,
    required ValidationState validationState,
    required double convertedAmount,
    required Currency selectedFiat,
    required Currency selectedCrypto,
  }) = _Swap;
}

@freezed
sealed class ValidationState with _$ValidationState {
  const factory ValidationState.loading() = _ValidationLoading;

  const factory ValidationState.success({
    required ValidationType type,
  }) = _ValidationSuccess;

  const factory ValidationState.error({required AppException error}) =
      _ValidationError;
}

enum ValidationType {
  select,
  swap,
}
