import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/vehicle_services.dart';

part 'rental_state.dart';

class RentalCubit extends Cubit<RentalState> {
  RentalCubit() : super(RentalStateInitial());

  Future<void> rent(int vehicleId) async {
    try {
      await VehicleServices.rentVehicle(vehicleId, DateTime.now());
      emit(RentalStateSuccess());
    } catch (e) {
      print(e);
      emit(RentalStateError(e.toString()));
    }
  }
}

