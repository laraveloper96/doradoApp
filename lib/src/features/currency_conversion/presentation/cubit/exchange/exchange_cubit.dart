import 'package:bloc/bloc.dart';
import 'package:currency_converter/src/domain/entities/currency.dart';
import 'package:currency_converter/src/services/currency_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_cubit.freezed.dart';
part 'exchange_state.dart';

class ExchangeCubit extends Cubit<ExchangeState> {
  ExchangeCubit(
    CurrencyService svc,
  )   : _svc = svc,
        super(const ExchangeState.initial());

  final CurrencyService _svc;

  Future<void> loadCurrencies() async {
    emit(const ExchangeState.loading());

    try {
      final result = await _svc.getAllCurrencies();

      emit(
        ExchangeState.success(
          currencies: result,
        ),
      );
    } catch (error) {
      emit(ExchangeState.failure(message: error.toString()));
    }
  }
}
