part of 'exchange_cubit.dart';

/// States for exchange functionality
@freezed
class ExchangeState with _$ExchangeState {
  /// Initial state
  const factory ExchangeState.initial() = _Initial;

  /// Loading state
  const factory ExchangeState.loading() = _Loading;

  /// Success state with conversion result
  const factory ExchangeState.success({
    required List<Currency> currencies,
  }) = _Success;

  /// Failure state
  const factory ExchangeState.failure({
    required String message,
  }) = _ExchangeFailure;
}
