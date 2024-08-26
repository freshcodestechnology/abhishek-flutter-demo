import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:weather_app/api_utility/api_repository.dart';
import 'package:weather_app/models/forecast_data.dart';
import 'package:weather_app/models/serializers.dart';

import '../../connectivity/connectivity_bloc.dart';

part 'weather_screen_event.dart';
part 'weather_screen_state.dart';

class WeatherScreenBloc extends HydratedBloc<WeatherScreenEvent, WeatherScreenState> {
  WeatherScreenBloc() : super(WeatherScreenInitial()) {


    on<FetchDataEvent>((event, emit) async {
      if (event.connectivityState is ConnectivityFailure) {
        if (state is WeatherScreenLoaded) {
          emit(WeatherScreenLoaded((state as WeatherScreenLoaded).dataList, true, (state as WeatherScreenLoaded).latitude, (state as WeatherScreenLoaded).longitude));
        } else {
          emit(const WeatherScreenError('No internet connection and no cached data.'));
        }
        return;
      }

      emit(WeatherScreenLoading());

      try {
        final location = await Geolocator.getCurrentPosition();
        final response = await ApiRepository.instance.getForecast(lat: location.latitude, lon: location.longitude);
        if (response.success) {
          final data = List<Map<String, dynamic>>.from(response.data['list']);

          final dataList = data.map((e) => serializers.deserializeWith(ForecastData.serializer, e)!).toList();
          print(dataList);
          emit(WeatherScreenLoaded(dataList, false, location.latitude, location.longitude));
        } else {
          emit(WeatherScreenError(response.error ?? 'Failed to load data.'));
        }
      } catch (e) {
        if (state is WeatherScreenLoaded) {
          emit(WeatherScreenLoaded((state as WeatherScreenLoaded).dataList, true, (state as WeatherScreenLoaded).latitude, (state as WeatherScreenLoaded).longitude));
        } else {
          emit(const WeatherScreenError('Failed to load data.'));
        }
      }
    });


  }

  @override
  WeatherScreenState? fromJson(Map<String, dynamic> json) {
    try {
      final data = List<Map<String, dynamic>>.from(json['list']);
      return WeatherScreenLoaded(
        data.map((e) => serializers.deserializeWith(ForecastData.serializer, e)!).toList(),
        json['isCached'] ?? false,
        json['lat'],
        json['lon'],
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(WeatherScreenState state) {
    if (state is WeatherScreenLoaded) {
      return {'data': state.dataList.map((e) => serializers.serializeWith(ForecastData.serializer, e)).toList()};
    }
    return null;
  }
}
