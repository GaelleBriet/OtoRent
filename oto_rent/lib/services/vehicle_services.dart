import 'package:oto_rent/data/vehicle_data_source.dart';

import '../models/vehicle_model.dart';

abstract class VehicleService {
  static List<VehicleModel> getVehicles() {
    //1 On récupère la donnée brute depuis la data source
    const List<Map<String, Object>> data = VehicleDataSource.vehicles;

    //2 On les transforme la donnée brute en représentation interne
    // (VehicleModel)
    final List<VehicleModel> vehicles =
        data.map((jsonVehicle) => VehicleModel.fromJson(jsonVehicle)).toList();

    //3On retourne la liste de véhicules
    return vehicles;
  }
}
