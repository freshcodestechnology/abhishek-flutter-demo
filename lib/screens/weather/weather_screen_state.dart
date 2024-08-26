part of 'weather_screen_bloc.dart';

abstract class WeatherScreenState extends Equatable {
  const WeatherScreenState();

  @override
  List<Object> get props => [];
}

class WeatherScreenInitial extends WeatherScreenState {}

class WeatherScreenLoading extends WeatherScreenState {}

class WeatherScreenLoaded extends WeatherScreenState {

  final List<ForecastData> dataList;
  final bool isCached;
  final double? latitude;
  final double? longitude;
  const WeatherScreenLoaded(this.dataList, this.isCached, this.latitude, this.longitude);

  @override
  List<Object> get props => [dataList, isCached];
}

class WeatherScreenError extends WeatherScreenState {
  final String message;

  const WeatherScreenError(this.message);

  @override
  List<Object> get props => [message];
}
