part of 'location_tracker_bloc.dart';

class LocationTrackerState extends Equatable {
  final bool isTracking;
  final double? latitude;
  final double? longitude;

  LocationTrackerState({
    required this.isTracking,
    this.latitude,
    this.longitude,
  });

  factory LocationTrackerState.initial() {
    return LocationTrackerState(isTracking: false);
  }

  LocationTrackerState copyWith({
    bool? isTracking,
    double? latitude,
    double? longitude,
  }) {
    return LocationTrackerState(
      isTracking: isTracking ?? this.isTracking,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  List<Object?> get props => [isTracking, latitude, longitude];
}

class PermissionDenied extends LocationTrackerState {
  PermissionDenied() : super(isTracking: false);
}

class PermissionDeniedForever extends LocationTrackerState {
  PermissionDeniedForever() : super(isTracking: false);
}

class PermissionGranted extends LocationTrackerState {
  PermissionGranted() : super(isTracking: false);
}
