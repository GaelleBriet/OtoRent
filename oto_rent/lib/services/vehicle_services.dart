import 'package:oto_rent/data/vehicles_data_source_network.dart';
import 'package:oto_rent/models/vehicle_model.dart';

abstract class VehicleServices {
  static Future<List<VehicleModel>> getVehicles(int agencyId) async{

    final List<Map<String, dynamic>> data =
    await VehiclesDataSourceNetwork.getVehicles();

    final List<VehicleModel> vehicles =
    data.map((jsonVehicle) => VehicleModel.fromJson(jsonVehicle)).toList();

    final List<VehicleModel> vehiclesFiltered =
    vehicles.where((vehicle) => vehicle.agencyId == agencyId).toList();

    return vehiclesFiltered;
  }

  static Future<void> rentVehicle(int vehicleId, DateTime date) {
    return VehiclesDataSourceNetwork.rentVehicle(vehicleId, date);
  }
}
