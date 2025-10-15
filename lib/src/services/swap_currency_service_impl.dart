import 'package:currency_converter/src/core/core.dart';
import 'package:currency_converter/src/domain/entities/conversion_rate.dart';
import 'package:currency_converter/src/services/swap_currency_service.dart';

final class SwapCurrencyServiceImpl implements SwapCurrencyService {
  SwapCurrencyServiceImpl(DioClient httpClient) : _httpClient = httpClient;

  final DioClient _httpClient;

  /// Get conversion rate between two currencies
  @override
  Future<ConversionRate> getConversionRate({
    required num type,
    required String cryptoCurrencyId,
    required String fiatCurrencyId,
    required double amount,
    required String amountCurrencyId,
  }) async {
    final response = await _httpClient.get(
      '/stage/orderbook/public/recommendations?type=$type&cryptoCurrencyId=$cryptoCurrencyId&fiatCurrencyId=$fiatCurrencyId&amount=$amount&amountCurrencyId=$amountCurrencyId',
    );
    final result = response.data as Map<String, dynamic>? ?? {};
    return ConversionRate.fromJson(
      result['data'] as Map<String, dynamic>? ?? {},
    );
  }
}
