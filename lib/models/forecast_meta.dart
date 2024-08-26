import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'forecast_meta.g.dart';

abstract class ForecastMeta implements Built<ForecastMeta, ForecastMetaBuilder> {
  static Serializer<ForecastMeta> get serializer => _$forecastMetaSerializer;

  num get temp;

  @BuiltValueField(wireName: 'feels_like')
  num get feelsLike;

  @BuiltValueField(wireName: 'temp_min')
  num get tempMin;

  @BuiltValueField(wireName: 'temp_max')
  num get tempMax;

  @BuiltValueField(wireName: 'pressure')
  num get pressure;

  @BuiltValueField(wireName: 'sea_level')
  num get seaLevel;

  @BuiltValueField(wireName: 'grnd_level')
  num get grndLevel;

  @BuiltValueField(wireName: 'humidity')
  num get humidity;

  @BuiltValueField(wireName: 'temp_kf')
  num get tempKF;

  double get tempCelsius => temp - 273.15;
  ForecastMeta._();

  factory ForecastMeta() = _$ForecastMeta;
}