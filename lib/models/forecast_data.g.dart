// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ForecastData> _$forecastDataSerializer =
    new _$ForecastDataSerializer();

class _$ForecastDataSerializer implements StructuredSerializer<ForecastData> {
  @override
  final Iterable<Type> types = const [ForecastData, _$ForecastData];
  @override
  final String wireName = 'ForecastData';

  @override
  Iterable<Object?> serialize(Serializers serializers, ForecastData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'dt',
      serializers.serialize(object.dt, specifiedType: const FullType(int)),
      'main',
      serializers.serialize(object.main,
          specifiedType: const FullType(ForecastMeta)),
      'weather',
      serializers.serialize(object.weather,
          specifiedType:
              const FullType(BuiltList, const [const FullType(WeatherData)])),
      'dt_txt',
      serializers.serialize(object.dtTxt,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ForecastData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ForecastDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'dt':
          result.dt = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'main':
          result.main.replace(serializers.deserialize(value,
              specifiedType: const FullType(ForecastMeta))! as ForecastMeta);
          break;
        case 'weather':
          result.weather.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(WeatherData)]))!
              as BuiltList<Object?>);
          break;
        case 'dt_txt':
          result.dtTxt = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ForecastData extends ForecastData {
  @override
  final int dt;
  @override
  final ForecastMeta main;
  @override
  final BuiltList<WeatherData> weather;
  @override
  final String dtTxt;

  factory _$ForecastData([void Function(ForecastDataBuilder)? updates]) =>
      (new ForecastDataBuilder()..update(updates))._build();

  _$ForecastData._(
      {required this.dt,
      required this.main,
      required this.weather,
      required this.dtTxt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(dt, r'ForecastData', 'dt');
    BuiltValueNullFieldError.checkNotNull(main, r'ForecastData', 'main');
    BuiltValueNullFieldError.checkNotNull(weather, r'ForecastData', 'weather');
    BuiltValueNullFieldError.checkNotNull(dtTxt, r'ForecastData', 'dtTxt');
  }

  @override
  ForecastData rebuild(void Function(ForecastDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ForecastDataBuilder toBuilder() => new ForecastDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ForecastData &&
        dt == other.dt &&
        main == other.main &&
        weather == other.weather &&
        dtTxt == other.dtTxt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dt.hashCode);
    _$hash = $jc(_$hash, main.hashCode);
    _$hash = $jc(_$hash, weather.hashCode);
    _$hash = $jc(_$hash, dtTxt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ForecastData')
          ..add('dt', dt)
          ..add('main', main)
          ..add('weather', weather)
          ..add('dtTxt', dtTxt))
        .toString();
  }
}

class ForecastDataBuilder
    implements Builder<ForecastData, ForecastDataBuilder> {
  _$ForecastData? _$v;

  int? _dt;
  int? get dt => _$this._dt;
  set dt(int? dt) => _$this._dt = dt;

  ForecastMetaBuilder? _main;
  ForecastMetaBuilder get main => _$this._main ??= new ForecastMetaBuilder();
  set main(ForecastMetaBuilder? main) => _$this._main = main;

  ListBuilder<WeatherData>? _weather;
  ListBuilder<WeatherData> get weather =>
      _$this._weather ??= new ListBuilder<WeatherData>();
  set weather(ListBuilder<WeatherData>? weather) => _$this._weather = weather;

  String? _dtTxt;
  String? get dtTxt => _$this._dtTxt;
  set dtTxt(String? dtTxt) => _$this._dtTxt = dtTxt;

  ForecastDataBuilder();

  ForecastDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dt = $v.dt;
      _main = $v.main.toBuilder();
      _weather = $v.weather.toBuilder();
      _dtTxt = $v.dtTxt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ForecastData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ForecastData;
  }

  @override
  void update(void Function(ForecastDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ForecastData build() => _build();

  _$ForecastData _build() {
    _$ForecastData _$result;
    try {
      _$result = _$v ??
          new _$ForecastData._(
              dt: BuiltValueNullFieldError.checkNotNull(
                  dt, r'ForecastData', 'dt'),
              main: main.build(),
              weather: weather.build(),
              dtTxt: BuiltValueNullFieldError.checkNotNull(
                  dtTxt, r'ForecastData', 'dtTxt'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'main';
        main.build();
        _$failedField = 'weather';
        weather.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ForecastData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
