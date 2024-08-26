import 'package:intl/intl.dart';
import 'package:weather_app/extensions/num_extension.dart';
import 'package:weather_app/models/forecast_data.dart';

class DataGroupHelper{
  // Group data by date
  Map<String, List<ForecastData>> groupWeatherDataByDate(List<ForecastData> data) {
    Map<String, List<ForecastData>> groupedData = {};

    for (var item in data) {
      DateTime dateTime = item.dt.milliSecondToDate;
      String dateKey = DateFormat('yyyy-MM-dd').format(dateTime);

      if (groupedData.containsKey(dateKey)) {
        groupedData[dateKey]!.add(item);
      } else {
        groupedData[dateKey] = [item];
      }
    }

    return groupedData;
  }
}