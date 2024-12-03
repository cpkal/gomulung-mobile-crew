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
    on<GetLocationStream>(_getLocationStream);
    on<GetCurrentLocation>(_getCurrentLocation);
    on<LocationChanging>(_onLocationChanging);
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
      add(LocationChanging(LatLng(position.latitude, position.longitude)));
    });
    emit(state.copyWith(isTracking: true));
  }

  void _onLocationChanging(
      LocationChanging event, Emitter<LocationTrackerState> emit) {
    emit(LocationChanged(event.location));
  }

  void _onStopTracking(StopTracking event, Emitter<LocationTrackerState> emit) {
    _positionSubscription?.cancel();
    emit(state.copyWith(isTracking: false));
  }

  void _getLocationStream(
      GetLocationStream event, Emitter<LocationTrackerState> emit) {
    emit(state.copyWith(isTracking: true));
  }

  void _getCurrentLocation(
      GetCurrentLocation event, Emitter<LocationTrackerState> emit) async {
    final position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    );
    emit(state.copyWith(
      latitude: position.latitude,
      longitude: position.longitude,
    ));
  }
}
