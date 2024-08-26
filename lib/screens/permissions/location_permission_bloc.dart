import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'location_permission_event.dart';
part 'location_permission_state.dart';

class LocationPermissionBloc
    extends Bloc<LocationPermissionEvent, LocationPermissionState> {
  LocationPermissionBloc() : super(LocationPermissionInitial()) {
    on<CheckLocationPermission>((event, emit) async {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(const LocationPermissionDenied('Location services are disabled.'));
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(
              const LocationPermissionDenied('Location permission is denied.'));
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(const LocationPermissionDenied(
            'Location permissions are permanently denied.'));
        return;
      }

      emit(LocationPermissionGranted());
    });
  }
}
