import 'package:currency_converter/src/core/utils/assets.gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency.freezed.dart';
part 'currency.g.dart';

/// Represents a currency
@freezed
class Currency with _$Currency {
  /// Creates a Currency
  const factory Currency({
    /// Currency code (e.g., USD, EUR)
    required String code,

    /// Currency name (e.g., US Dollar, Euro)
    required String name,

    /// Image path for the currency
    @JsonKey(
      name: 'image',
      readValue: _assetPathMapper,
    )
    required String path,
    required CurrencyType type,
    required String symbol,
  }) = _Currency;

  /// Creates a Currency from JSON
  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
}

enum CurrencyType {
  @JsonValue('FIAT')
  fiat,
  @JsonValue('CRYPTO')
  crypto,
}

// readValue should return the raw value (num), not Duration
Object? _assetPathMapper(Map<dynamic, dynamic> map, String key) {
  final code = map[key] as String? ?? '';
  switch (code.toUpperCase()) {
    case 'BRL':
      return DoradoAssets.fiatCurrencies.brl.path;
    case 'COP':
      return DoradoAssets.fiatCurrencies.cop.path;
    case 'PEN':
      return DoradoAssets.fiatCurrencies.pen.path;
    case 'VES':
      return DoradoAssets.fiatCurrencies.ves.path;
    case 'TATUM-TRON-USDT':
      return DoradoAssets.criptoCurrencies.tatumTronUsdt.path;
    default:
      return '';
  }
}
