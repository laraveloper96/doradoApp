// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyImpl _$$CurrencyImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      path: _assetPathMapper(json, 'image') as String,
      type: $enumDecode(_$CurrencyTypeEnumMap, json['type']),
      symbol: json['symbol'] as String,
    );

Map<String, dynamic> _$$CurrencyImplToJson(_$CurrencyImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'image': instance.path,
      'type': _$CurrencyTypeEnumMap[instance.type]!,
      'symbol': instance.symbol,
    };

const _$CurrencyTypeEnumMap = {
  CurrencyType.fiat: 'FIAT',
  CurrencyType.crypto: 'CRYPTO',
};
