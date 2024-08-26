import 'package:weather_app/api_utility/api_client.dart';
import 'package:weather_app/api_utility/api_response.dart';
import 'package:weather_app/utility/constants.dart';

import 'api_urls.dart';

class ApiRepository {
  final ApiClient client = ApiClient.instance(ApiUrls.baseUrl);

  static final ApiRepository instance = ApiRepository._internal();

  ApiRepository._internal();

  factory ApiRepository() {
    return instance;
  }

  Future<ApiResponse> getForecast(
      {required double lat, required double lon}) async {
    final response = await client.get(
      path: ApiUrls.getForecast,
      queryParameters: {
        'lat': lat,
        'lon': lon,
        'appid': Constants.openWeatherAppId,
      },
    );

    return response;
  }
}
