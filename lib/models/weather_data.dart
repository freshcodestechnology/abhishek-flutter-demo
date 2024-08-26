import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'weather_data.g.dart';

abstract class WeatherData implements Built<WeatherData, WeatherDataBuilder> {
  static Serializer<WeatherData> get serializer => _$weatherDataSerializer;

  num get id;

  @BuiltValueField(wireName: 'main')
  String get main;

  @BuiltValueField(wireName: 'description')
  String get description;

  @BuiltValueField(wireName: 'icon')
  String get icon;

  WeatherData._();

  factory WeatherData() = _$WeatherData;
}