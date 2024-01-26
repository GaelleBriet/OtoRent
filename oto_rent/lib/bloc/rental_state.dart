part of 'rental_cubit.dart';

abstract class RentalState {
  const RentalState();
}

class RentalStateInitial extends RentalState {}

class RentalStateSuccess extends RentalState {}

class RentalStateError extends RentalState {
  final String message;

  const RentalStateError(this.message);
}