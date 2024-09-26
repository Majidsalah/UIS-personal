part of 'location_permission_cubit.dart';

class LocationPermissionState {}

final class LocationPermissionInitial extends LocationPermissionState {}

final class LocationPermissionDenied extends LocationPermissionState {}

final class LocationPermissionDeniesForever extends LocationPermissionState {}

final class LocationPermissionAccepted extends LocationPermissionState {
  final Position position;

  LocationPermissionAccepted({required this.position});
}

final class LocationServiceDisabled extends LocationPermissionState {}
