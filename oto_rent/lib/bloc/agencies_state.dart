part of 'agencies_cubit.dart';

abstract class AgenciesState {
  const AgenciesState();
}

class AgenciesStateInitial extends AgenciesState {}

class AgenciesStateLoading extends AgenciesState {}

class AgenciesStateSuccess extends AgenciesState {
  final List<AgencyModel> agencies;

  const AgenciesStateSuccess(this.agencies);
}

class AgenciesStateError extends AgenciesState {
  final String message;

  const AgenciesStateError(this.message);
}