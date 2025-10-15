import 'package:currency_converter/src/core/mocks/currencies_mock.dart';
import 'package:currency_converter/src/core/network/dio_client.dart';
import 'package:currency_converter/src/features/currency_conversion/presentation/cubit/exchange/exchange_cubit.dart';
import 'package:currency_converter/src/features/currency_conversion/presentation/cubit/exchange_swap/exchange_swap_cubit.dart';
import 'package:currency_converter/src/services/currency_service.dart';
import 'package:currency_converter/src/services/swap_currency_service.dart';
import 'package:currency_converter/src/services/swap_currency_service_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

class AppModules {
  static void initializeDependencies() {
    _setupMainModule();
    _setupBlocModule();
    _setupServiceModule();
    _setupPreferencesModule();
  }

  static void _setupMainModule() {
    getIt
      ..registerLazySingleton(Dio.new)
      ..registerSingleton(DioClient(getIt.get()));
  }

  static void _setupBlocModule() {
    getIt
      ..registerFactory(
        () => ExchangeCubit(getIt.get<CurrencyService>()),
      )
      ..registerFactory(
        () => ExchangeSwapCubit(getIt.get<SwapCurrencyService>()),
      );
  }

  static void _setupServiceModule() {
    getIt
      ..registerFactory<CurrencyService>(
        CurrencyServiceMock.new,
      )
      ..registerFactory<SwapCurrencyService>(
        () => SwapCurrencyServiceImpl(getIt.get<DioClient>()),
      );
  }

  static void _setupPreferencesModule() {
    getIt.registerLazySingleton(SharedPreferences.getInstance);
  }
}
