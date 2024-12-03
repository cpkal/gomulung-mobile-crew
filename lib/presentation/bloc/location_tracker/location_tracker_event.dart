part of 'location_tracker_bloc.dart';

sealed class LocationTrackerEvent extends Equatable {
  const LocationTrackerEvent();

  @override
  List<Object> get props => [];
}

class GetPermission extends LocationTrackerEvent {}

class StartTracking extends LocationTrackerEvent {}

class StopTracking extends LocationTrackerEvent {}

class GetLocationStream extends LocationTrackerEvent {}

class GetCurrentLocation extends LocationTrackerEvent {}

class LocationChanging extends LocationTrackerEvent {
  final LatLng location;

  LocationChanging(this.location);

  @override
  List<Object> get props => [location];
}
