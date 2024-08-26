// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_meta.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ForecastMeta> _$forecastMetaSerializer =
    new _$ForecastMetaSerializer();

class _$ForecastMetaSerializer implements StructuredSerializer<ForecastMeta> {
  @override
  final Iterable<Type> types = const [ForecastMeta, _$ForecastMeta];
  @override
  final String wireName = 'ForecastMeta';

  @override
  Iterable<Object?> serialize(Serializers serializers, ForecastMeta object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'temp',
      serializers.serialize(object.temp, specifiedType: const FullType(num)),
      'feels_like',
      serializers.serialize(object.feelsLike,
          specifiedType: const FullType(num)),
      'temp_min',
      serializers.serialize(object.tempMin, specifiedType: const FullType(num)),
      'temp_max',
      serializers.serialize(object.tempMax, specifiedType: const FullType(num)),
      'pressure',
      serializers.serialize(object.pressure,
          specifiedType: const FullType(num)),
      'sea_level',
      serializers.serialize(object.seaLevel,
          specifiedType: const FullType(num)),
      'grnd_level',
      serializers.serialize(object.grndLevel,
          specifiedType: const FullType(num)),
      'humidity',
      serializers.serialize(object.humidity,
          specifiedType: const FullType(num)),
      'temp_kf',
      serializers.serialize(object.tempKF, specifiedType: const FullType(num)),
    ];

    return result;
  }

  @override
  ForecastMeta deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ForecastMetaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'temp':
          result.temp = serializers.deserialize(value,
              specifiedType: const FullType(num))! as num;
          break;
        case 'feels_like':
          result.feelsLike = serializers.deserialize(value,
              specifiedType: const FullType(num))! as num;
          break;
        case 'temp_min':
          result.tempMin = serializers.deserialize(value,
              specifiedType: const FullType(num))! as num;
          break;
        case 'temp_max':
          result.tempMax = serializers.deserialize(value,
              specifiedType: const FullType(num))! as num;
          break;
        case 'pressure':
          result.pressure = serializers.deserialize(value,
              specifiedType: const FullType(num))! as num;
          break;
        case 'sea_level':
          result.seaLevel = serializers.deserialize(value,
              specifiedType: const FullType(num))! as num;
          break;
        case 'grnd_level':
          result.grndLevel = serializers.deserialize(value,
              specifiedType: const FullType(num))! as num;
          break;
        case 'humidity':
          result.humidity = serializers.deserialize(value,
              specifiedType: const FullType(num))! as num;
          break;
        case 'temp_kf':
          result.tempKF = serializers.deserialize(value,
              specifiedType: const FullType(num))! as num;
          break;
      }
    }

    return result.build();
  }
}

class _$ForecastMeta extends ForecastMeta {
  @override
  final num temp;
  @override
  final num feelsLike;
  @override
  final num tempMin;
  @override
  final num tempMax;
  @override
  final num pressure;
  @override
  final num seaLevel;
  @override
  final num grndLevel;
  @override
  final num humidity;
  @override
  final num tempKF;

  factory _$ForecastMeta([void Function(ForecastMetaBuilder)? updates]) =>
      (new ForecastMetaBuilder()..update(updates))._build();

  _$ForecastMeta._(
      {required this.temp,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.seaLevel,
      required this.grndLevel,
      required this.humidity,
      required this.tempKF})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(temp, r'ForecastMeta', 'temp');
    BuiltValueNullFieldError.checkNotNull(
        feelsLike, r'ForecastMeta', 'feelsLike');
    BuiltValueNullFieldError.checkNotNull(tempMin, r'ForecastMeta', 'tempMin');
    BuiltValueNullFieldError.checkNotNull(tempMax, r'ForecastMeta', 'tempMax');
    BuiltValueNullFieldError.checkNotNull(
        pressure, r'ForecastMeta', 'pressure');
    BuiltValueNullFieldError.checkNotNull(
        seaLevel, r'ForecastMeta', 'seaLevel');
    BuiltValueNullFieldError.checkNotNull(
        grndLevel, r'ForecastMeta', 'grndLevel');
    BuiltValueNullFieldError.checkNotNull(
        humidity, r'ForecastMeta', 'humidity');
    BuiltValueNullFieldError.checkNotNull(tempKF, r'ForecastMeta', 'tempKF');
  }

  @override
  ForecastMeta rebuild(void Function(ForecastMetaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ForecastMetaBuilder toBuilder() => new ForecastMetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ForecastMeta &&
        temp == other.temp &&
        feelsLike == other.feelsLike &&
        tempMin == other.tempMin &&
        tempMax == other.tempMax &&
        pressure == other.pressure &&
        seaLevel == other.seaLevel &&
        grndLevel == other.grndLevel &&
        humidity == other.humidity &&
        tempKF == other.tempKF;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, temp.hashCode);
    _$hash = $jc(_$hash, feelsLike.hashCode);
    _$hash = $jc(_$hash, tempMin.hashCode);
    _$hash = $jc(_$hash, tempMax.hashCode);
    _$hash = $jc(_$hash, pressure.hashCode);
    _$hash = $jc(_$hash, seaLevel.hashCode);
    _$hash = $jc(_$hash, grndLevel.hashCode);
    _$hash = $jc(_$hash, humidity.hashCode);
    _$hash = $jc(_$hash, tempKF.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ForecastMeta')
          ..add('temp', temp)
          ..add('feelsLike', feelsLike)
          ..add('tempMin', tempMin)
          ..add('tempMax', tempMax)
          ..add('pressure', pressure)
          ..add('seaLevel', seaLevel)
          ..add('grndLevel', grndLevel)
          ..add('humidity', humidity)
          ..add('tempKF', tempKF))
        .toString();
  }
}

class ForecastMetaBuilder
    implements Builder<ForecastMeta, ForecastMetaBuilder> {
  _$ForecastMeta? _$v;

  num? _temp;
  num? get temp => _$this._temp;
  set temp(num? temp) => _$this._temp = temp;

  num? _feelsLike;
  num? get feelsLike => _$this._feelsLike;
  set feelsLike(num? feelsLike) => _$this._feelsLike = feelsLike;

  num? _tempMin;
  num? get tempMin => _$this._tempMin;
  set tempMin(num? tempMin) => _$this._tempMin = tempMin;

  num? _tempMax;
  num? get tempMax => _$this._tempMax;
  set tempMax(num? tempMax) => _$this._tempMax = tempMax;

  num? _pressure;
  num? get pressure => _$this._pressure;
  set pressure(num? pressure) => _$this._pressure = pressure;

  num? _seaLevel;
  num? get seaLevel => _$this._seaLevel;
  set seaLevel(num? seaLevel) => _$this._seaLevel = seaLevel;

  num? _grndLevel;
  num? get grndLevel => _$this._grndLevel;
  set grndLevel(num? grndLevel) => _$this._grndLevel = grndLevel;

  num? _humidity;
  num? get humidity => _$this._humidity;
  set humidity(num? humidity) => _$this._humidity = humidity;

  num? _tempKF;
  num? get tempKF => _$this._tempKF;
  set tempKF(num? tempKF) => _$this._tempKF = tempKF;

  ForecastMetaBuilder();

  ForecastMetaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _temp = $v.temp;
      _feelsLike = $v.feelsLike;
      _tempMin = $v.tempMin;
      _tempMax = $v.tempMax;
      _pressure = $v.pressure;
      _seaLevel = $v.seaLevel;
      _grndLevel = $v.grndLevel;
      _humidity = $v.humidity;
      _tempKF = $v.tempKF;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ForecastMeta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ForecastMeta;
  }

  @override
  void update(void Function(ForecastMetaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ForecastMeta build() => _build();

  _$ForecastMeta _build() {
    final _$result = _$v ??
        new _$ForecastMeta._(
            temp: BuiltValueNullFieldError.checkNotNull(
                temp, r'ForecastMeta', 'temp'),
            feelsLike: BuiltValueNullFieldError.checkNotNull(
                feelsLike, r'ForecastMeta', 'feelsLike'),
            tempMin: BuiltValueNullFieldError.checkNotNull(
                tempMin, r'ForecastMeta', 'tempMin'),
            tempMax: BuiltValueNullFieldError.checkNotNull(
                tempMax, r'ForecastMeta', 'tempMax'),
            pressure: BuiltValueNullFieldError.checkNotNull(
                pressure, r'ForecastMeta', 'pressure'),
            seaLevel: BuiltValueNullFieldError.checkNotNull(
                seaLevel, r'ForecastMeta', 'seaLevel'),
            grndLevel: BuiltValueNullFieldError.checkNotNull(
                grndLevel, r'ForecastMeta', 'grndLevel'),
            humidity: BuiltValueNullFieldError.checkNotNull(
                humidity, r'ForecastMeta', 'humidity'),
            tempKF: BuiltValueNullFieldError.checkNotNull(
                tempKF, r'ForecastMeta', 'tempKF'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
