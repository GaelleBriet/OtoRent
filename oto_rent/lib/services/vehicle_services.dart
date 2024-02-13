import 'package:oto_rent/data/file_data_source.dart';
import 'package:oto_rent/data/vehicles_data_source_network.dart';
import 'package:oto_rent/models/vehicle_model.dart';

abstract class VehicleServices {
  static Future<List<VehicleModel>> getVehicles(int? agencyId) async{

    final List<Map<String, dynamic>> data =
    await VehiclesDataSourceNetwork.getVehicles();

    final List<VehicleModel> vehicles =
    data.map((jsonVehicle) => VehicleModel.fromJson(jsonVehicle)).toList();

    final List<VehicleModel> vehiclesFiltered =
    vehicles.where((vehicle) => vehicle.agencyId == agencyId).toList();

    return vehiclesFiltered;
  }

  static Future<List<VehicleModel>> getAllVehicles() async {
    final List<Map<String, dynamic>> data =
    await VehiclesDataSourceNetwork.getVehicles();

    final List<VehicleModel> vehicles =
    data.map((jsonVehicle) => VehicleModel.fromJson(jsonVehicle)).toList();

    return vehicles;
  }

  static Future<void> rentVehicle(int vehicleId, DateTime date) {
    return VehiclesDataSourceNetwork.rentVehicle(vehicleId, date);
  }

  static Future<void> exportVehicles() async {
    // 1. récupérer tous les véhicules
    final List<VehicleModel> vehicles = await getAllVehicles();
    // 2. créer une string en md
    final content = StringBuffer();
    for (final vehicle in vehicles) {
      content.writeln(vehicle.toMarkdown());
    }
    // 3. utiliser la data source pour exporter ce markdown
    await FileDataSource.exportAndSave(content.toString());
  }
}
