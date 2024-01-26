part of 'geolocation_cubit.dart';

abstract class GeolocationState {
  const GeolocationState();
}

class GeolocationInitial extends GeolocationState {}

class GeolocationStateLoading extends GeolocationState {}

class GeolocationStateUpdated extends GeolocationState {
  final LocationModel location;

  const GeolocationStateUpdated(this.location);
}

class GeolocationStateError extends GeolocationState {
  final String message;

  const GeolocationStateError(this.message);
}