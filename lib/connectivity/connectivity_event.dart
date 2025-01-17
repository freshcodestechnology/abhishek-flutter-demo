part of 'connectivity_bloc.dart';

abstract class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();

  @override
  List<Object> get props => [];
}

class CheckConnectivity extends ConnectivityEvent {}

class ConnectionLost extends ConnectivityEvent {}

class ConnectionRestored extends ConnectivityEvent {}