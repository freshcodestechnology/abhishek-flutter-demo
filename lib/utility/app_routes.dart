import 'package:flutter/material.dart';

import '../screens/permissions/permissions_screen.dart';
import '../screens/weather/weather_screen.dart';

class AppRoutes {
  static const root = '/';
  static const weather = '/weather';

  static Map<String, WidgetBuilder> routes = {
    root: (context) => const PermissionsScreen(),
    weather: (context) => const WeatherScreen(),
  };
}
