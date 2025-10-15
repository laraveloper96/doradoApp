import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversion_rate.freezed.dart';
part 'conversion_rate.g.dart';

/// Represents a conversion rate between two currencies
@freezed
class ConversionRate with _$ConversionRate {
  const factory ConversionRate({
    @JsonKey(
      name: 'byPrice',
      readValue: _stringToDoubleMapper,
    )
    required double rate,
  }) = _ConversionRate;

  /// Creates a ConversionRate from JSON
  factory ConversionRate.fromJson(Map<String, dynamic> json) =>
      _$ConversionRateFromJson(json);
}

// readValue should return the raw value (num), not Duration
Object? _stringToDoubleMapper(Map<dynamic, dynamic> map, String key) {
  final byPrice = map[key] as Map<dynamic, dynamic>? ?? {};
  final rate = byPrice['fiatToCryptoExchangeRate'] as String? ?? '0';
  return double.tryParse(rate) ?? 0.0;
}
