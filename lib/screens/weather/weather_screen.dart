import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/extensions/num_extension.dart';
import 'package:weather_app/models/forecast_data.dart';
import 'package:weather_app/screens/weather/weather_screen_bloc.dart';
import 'package:weather_app/utility/DataGroupHelper.dart';
import 'package:weather_app/utility/constants.dart';
import 'package:weather_app/widgets/forecast_item_widget.dart';

import '../../connectivity/connectivity_bloc.dart';
import '../../utility/color_constants.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late WeatherScreenBloc _weatherScreenBloc;

  @override
  void initState() {
    super.initState();
    _weatherScreenBloc = context.read<WeatherScreenBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text(Constants.appName)),
      body: BlocConsumer<ConnectivityBloc, ConnectivityState>(
        listener: (context, connectivityState) {
          if (connectivityState is ConnectivitySuccess) {
            _weatherScreenBloc.add(FetchDataEvent(connectivityState));
          } else if (connectivityState is ConnectivityFailure) {
            _weatherScreenBloc.add(FetchDataEvent(connectivityState));
          }
        },
        builder: (context, state) {
          return BlocBuilder<WeatherScreenBloc, WeatherScreenState>(
            builder: (context, state) {
              if (state is WeatherScreenInitial) {
                return const Center(child: Text('No data loaded yet.'));
              } else if (state is WeatherScreenLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is WeatherScreenLoaded) {
                final groupedData = DataGroupHelper().groupWeatherDataByDate(state.dataList);
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (state.isCached)
                          const Text(
                            'Showing cached data ================:',
                            style: TextStyle(color: Colors.black),
                          ),
                        // Date and Location
                        Text(
                          'Date: ${DateFormat('dd MMM yyyy').format(DateTime.now().toLocal())}',
                          style: const TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'LAT ${state.latitude?.toStringAsFixed(2)}, LON ${state.longitude?.toStringAsFixed(2)}',
                          style: const TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          state.dataList.first.weather.first.description,
                          style: const TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        const SizedBox(height: 40),

                        // Weather Icon and Temperature
                        Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: ColorConstants.tileColor),
                            child: Image.network(
                              'https://openweathermap.org/img/wn/${state.dataList.first.weather[0].icon}.png',
                              height: 80,
                              width: 80,
                            )),
                        const SizedBox(height: 20),
                        Text(
                          '${state.dataList.first.main.tempCelsius.toStringAsFixed(0)}°',
                          style: const TextStyle(color: Colors.black, fontSize: 80, fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'max ${state.dataList.first.main.tempMax.toString()}°',
                              style: const TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'min ${state.dataList.first.main.tempMin.toString()}',
                              style: const TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ],
                        ),
                        // Additional Info
                        const Divider(color: Colors.grey),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            additionalInfo('Pressure', '${state.dataList.first.main.pressure.toString()} hPa'), // Placeholder
                            additionalInfo('Humidity', '${state.dataList.first.main.humidity.toString()}%'),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        // Forecast List
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: groupedData.keys.length,
                          itemBuilder: (context, index) {
                            // Get the date key and weather data for this date
                            String dateKey = groupedData.keys.elementAt(index);
                            List<ForecastData> weatherList = groupedData[dateKey]!;

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Date header
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    DateFormat('dd MMM yyyy').format(DateTime.parse(dateKey)),
                                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                // List of weather items for this date
                                SizedBox(
                                  height: 120, // Adjust height as needed
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: weatherList.length,
                                    itemBuilder: (context, itemIndex) {
                                      var item = weatherList[itemIndex];
                                      var dateTime = item.dt.milliSecondToDate;
                                      var time = '${dateTime.hour}:00';
                                      var temp = item.main.tempCelsius.toStringAsFixed(0);
                                      return ForecastItemWidget().forecastItem(
                                        time,
                                        item.weather[0].icon,
                                        '$temp°',
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is WeatherScreenError) {
                return Center(child: Text(state.message));
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }

  // Widget for additional weather information
  Widget additionalInfo(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
