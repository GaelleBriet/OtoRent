import 'package:oto_rent/data/mock/vehicles_data_source.dart';
import 'package:oto_rent/models/vehicle_model.dart';

class VehicleServices {
  static List<VehicleModel> getVehicles() {
    const vehicles = VehiclesDataSourceMock.data;
    return vehicles.map((vehicle) => VehicleModel.fromJson(vehicle)).toList();
  }
}
