import 'package:oto_rent/data/agencies_data_source_network.dart';
import 'package:oto_rent/models/agency_model.dart';

abstract class AgenciesServices {
  static Future<List<AgencyModel>> getAgencies() async{

    final List<Map<String, dynamic>> data =
    await AgenciesDataSourceNetwork.getAgencies();

    final List<AgencyModel> vehicles =
    data.map((jsonVehicle) => AgencyModel.fromJson(jsonVehicle)).toList();

    return vehicles;
  }
}
