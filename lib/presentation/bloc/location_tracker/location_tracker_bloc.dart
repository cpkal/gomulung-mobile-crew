import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

part 'location_tracker_event.dart';
part 'location_tracker_state.dart';

class LocationTrackerBloc
    extends Bloc<LocationTrackerEvent, LocationTrackerState> {
  LocationTrackerBloc() : super(LocationTrackerState(isTracking: false)) {
    on<GetPermission>(_getPermission);
    on<StartTracking>(_onStartTracking);
    on<StopTracking>(_onStopTracking);
    on<LocationChanged>(_onLocationChanged);
  }

  Stream<Position>? _positionStream;
  StreamSubscription<Position>? _positionSubscription;

  void _getPermission(
      GetPermission event, Emitter<LocationTrackerState> emit) async {
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.deniedForever) {
      print('denied forever');
      emit(PermissionDeniedForever());
    } else if (permission == LocationPermission.denied) {
      print('denied');
      emit(PermissionDenied());
    } else {
      print('granted');
      emit(PermissionGranted());
    }
  }

  void _onStartTracking(
      StartTracking event, Emitter<LocationTrackerState> emit) {
    _positionStream = Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    );
    _positionSubscription = _positionStream!.listen((position) {
      print('Location: ${position.latitude}, ${position.longitude}');
      add(LocationChanged(LatLng(position.latitude, position.longitude)));
    });
    emit(state.copyWith(isTracking: true));
  }

  void _onStopTracking(StopTracking event, Emitter<LocationTrackerState> emit) {
    _positionSubscription?.cancel();
    emit(state.copyWith(isTracking: false));
  }

  void _onLocationChanged(
      LocationChanged event, Emitter<LocationTrackerState> emit) {
    emit(state.copyWith(
      latitude: event.location.latitude,
      longitude: event.location.longitude,
    ));
  }
}
