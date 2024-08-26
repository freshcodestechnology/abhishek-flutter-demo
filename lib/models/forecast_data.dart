import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:weather_app/models/forecast_meta.dart';
import 'package:weather_app/models/weather_data.dart';

part 'forecast_data.g.dart';

abstract class ForecastData
    implements Built<ForecastData, ForecastDataBuilder> {
  static Serializer<ForecastData> get serializer => _$forecastDataSerializer;

  int get dt;

  @BuiltValueField(wireName: 'main')
  ForecastMeta get main;

  @BuiltValueField(wireName: 'weather')
  BuiltList<WeatherData> get weather;

  @BuiltValueField(wireName: 'dt_txt')
  String get dtTxt;

  ForecastData._();

  factory ForecastData() = _$ForecastData;
}
