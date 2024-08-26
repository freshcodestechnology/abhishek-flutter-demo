import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  ConnectivityBloc() : super(ConnectivityInitial()) {

    on<CheckConnectivity>((event, emit) async {
      final connectivityResult = await _connectivity.checkConnectivity();
print('First Call  Connectivity result$connectivityResult');
      if (connectivityResult.contains(ConnectivityResult.none)) {
        print('  Connectivity result$connectivityResult');
        emit(ConnectivityFailure());
      } else {
        emit(ConnectivitySuccess());
      }
    });

    on<ConnectionLost>((event, emit) {
      emit(ConnectivityFailure());
    });

    on<ConnectionRestored>((event, emit) {
      emit(ConnectivitySuccess());
    });

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result.contains(ConnectivityResult.none)) {
        add(ConnectionLost());
      } else {
        add(ConnectionRestored());
      }
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
