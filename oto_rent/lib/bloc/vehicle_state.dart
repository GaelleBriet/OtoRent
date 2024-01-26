part of 'vehicle_cubit.dart';

abstract class VehicleState {
  const VehicleState();
}

class VehicleStateInitial extends VehicleState {}

class VehicleStateLoading extends VehicleState {}

class VehicleStateSuccess extends VehicleState {
  final List<VehicleModel> vehicles;

  const VehicleStateSuccess(this.vehicles);
}

class VehicleStateError extends VehicleState {
  final String message;

  const VehicleStateError(this.message);
}