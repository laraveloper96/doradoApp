import 'package:currency_converter/src/core/utils/assets.gen.dart';
import 'package:currency_converter/src/core/utils/mock_helper.dart';
import 'package:currency_converter/src/domain/entities/currency.dart';
import 'package:currency_converter/src/services/currency_service.dart';

final class CurrencyServiceMock
    with MockResponseHelper
    implements CurrencyService {
  @override
  Future<List<Currency>> getAllCurrencies() async {
    return handleMockRequest<List<Currency>, Map<String, dynamic>>(
      endpointFile: DoradoAssets.mocks.currencies,
      mapper: (data) {
        final currencies = data['data'] as List<dynamic>;
        return currencies
            .map((e) => Currency.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }
}
