import 'package:dio/dio.dart';
import 'package:weather_app/api_utility/api_response.dart';

class ApiClient {
  final String baseUrl;

  const ApiClient._(this.baseUrl);

  static ApiClient instance(final String baseUrl) => ApiClient._(baseUrl);

  Future<ApiResponse> get({
    required final String path,
    final Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Dio dio = _getDio();
      final Response res =
          await dio.get(path, queryParameters: queryParameters);
      return ApiResponse(res, null);
    } on DioException catch (e) {
      return ApiResponse(e.response, e);
    }
  }

  Dio _getDio() {
    final Dio dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    return dio;
  }
}
