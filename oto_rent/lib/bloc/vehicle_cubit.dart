import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/vehicle_model.dart';
import 'package:oto_rent/services/vehicle_services.dart';

part 'vehicle_state.dart';

class VehicleCubit extends Cubit<VehicleState>{

  VehicleCubit() : super(VehicleStateInitial());

  Future<void> fetchVehicles({
    required int agencyId,
    }) async {
    emit(VehicleStateLoading());

    try {
      final vehicles = await VehicleServices.getVehicles(agencyId);
      emit(VehicleStateSuccess(vehicles));
    } catch (e) {
      emit(VehicleStateError(e.toString()));
    }
  }
}
