// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversion_rate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConversionRate _$ConversionRateFromJson(Map<String, dynamic> json) {
  return _ConversionRate.fromJson(json);
}

/// @nodoc
mixin _$ConversionRate {
  @JsonKey(name: 'byPrice', readValue: _stringToDoubleMapper)
  double get rate => throw _privateConstructorUsedError;

  /// Serializes this ConversionRate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConversionRate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConversionRateCopyWith<ConversionRate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversionRateCopyWith<$Res> {
  factory $ConversionRateCopyWith(
          ConversionRate value, $Res Function(ConversionRate) then) =
      _$ConversionRateCopyWithImpl<$Res, ConversionRate>;
  @useResult
  $Res call(
      {@JsonKey(name: 'byPrice', readValue: _stringToDoubleMapper)
      double rate});
}

/// @nodoc
class _$ConversionRateCopyWithImpl<$Res, $Val extends ConversionRate>
    implements $ConversionRateCopyWith<$Res> {
  _$ConversionRateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConversionRate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
  }) {
    return _then(_value.copyWith(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConversionRateImplCopyWith<$Res>
    implements $ConversionRateCopyWith<$Res> {
  factory _$$ConversionRateImplCopyWith(_$ConversionRateImpl value,
          $Res Function(_$ConversionRateImpl) then) =
      __$$ConversionRateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'byPrice', readValue: _stringToDoubleMapper)
      double rate});
}

/// @nodoc
class __$$ConversionRateImplCopyWithImpl<$Res>
    extends _$ConversionRateCopyWithImpl<$Res, _$ConversionRateImpl>
    implements _$$ConversionRateImplCopyWith<$Res> {
  __$$ConversionRateImplCopyWithImpl(
      _$ConversionRateImpl _value, $Res Function(_$ConversionRateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConversionRate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
  }) {
    return _then(_$ConversionRateImpl(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConversionRateImpl implements _ConversionRate {
  const _$ConversionRateImpl(
      {@JsonKey(name: 'byPrice', readValue: _stringToDoubleMapper)
      required this.rate});

  factory _$ConversionRateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversionRateImplFromJson(json);

  @override
  @JsonKey(name: 'byPrice', readValue: _stringToDoubleMapper)
  final double rate;

  @override
  String toString() {
    return 'ConversionRate(rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversionRateImpl &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rate);

  /// Create a copy of ConversionRate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversionRateImplCopyWith<_$ConversionRateImpl> get copyWith =>
      __$$ConversionRateImplCopyWithImpl<_$ConversionRateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversionRateImplToJson(
      this,
    );
  }
}

abstract class _ConversionRate implements ConversionRate {
  const factory _ConversionRate(
      {@JsonKey(name: 'byPrice', readValue: _stringToDoubleMapper)
      required final double rate}) = _$ConversionRateImpl;

  factory _ConversionRate.fromJson(Map<String, dynamic> json) =
      _$ConversionRateImpl.fromJson;

  @override
  @JsonKey(name: 'byPrice', readValue: _stringToDoubleMapper)
  double get rate;

  /// Create a copy of ConversionRate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConversionRateImplCopyWith<_$ConversionRateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
