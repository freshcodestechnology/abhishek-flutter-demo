part of 'location_permission_bloc.dart';

abstract class LocationPermissionState extends Equatable {
  const LocationPermissionState();

  @override
  List<Object> get props => [];
}

class LocationPermissionInitial extends LocationPermissionState {}

class LocationPermissionGranted extends LocationPermissionState {}

class LocationPermissionDenied extends LocationPermissionState {
  final String message;

  const LocationPermissionDenied(this.message);

  @override
  List<Object> get props => [message];
}
