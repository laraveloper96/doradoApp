// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversion_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversionRateImpl _$$ConversionRateImplFromJson(Map<String, dynamic> json) =>
    _$ConversionRateImpl(
      rate: (_stringToDoubleMapper(json, 'byPrice') as num).toDouble(),
    );

Map<String, dynamic> _$$ConversionRateImplToJson(
        _$ConversionRateImpl instance) =>
    <String, dynamic>{
      'byPrice': instance.rate,
    };
