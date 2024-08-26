part of 'weather_screen_bloc.dart';

abstract class WeatherScreenEvent extends Equatable {
  const WeatherScreenEvent();

  @override
  List<Object> get props => [];
}

class FetchDataEvent extends WeatherScreenEvent {
  final ConnectivityState connectivityState;

  const FetchDataEvent(this.connectivityState);

  @override
  List<Object> get props => [connectivityState];
}