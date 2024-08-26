import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/utility/app_routes.dart';

import 'location_permission_bloc.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LocationPermissionBloc()..add(CheckLocationPermission()),
      child: Scaffold(
        body: BlocListener<LocationPermissionBloc, LocationPermissionState>(
          listener: (context, state) {
            if (state is LocationPermissionGranted) {
              Navigator.pushReplacementNamed(context, AppRoutes.weather);
            } else if (state is LocationPermissionDenied) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          child: Center(
            child: Image.asset(
              'assets/images/icon_app.png',
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
