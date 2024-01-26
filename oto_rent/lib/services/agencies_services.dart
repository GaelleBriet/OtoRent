import 'package:geolocator/geolocator.dart';
import 'package:oto_rent/data/agencies_data_source_network.dart';
import 'package:oto_rent/models/agency_model.dart';

import '../data/geolocation_data_source.dart';
import '../models/location_model.dart';

abstract class AgenciesServices {
  static Future<List<AgencyModel>> getAgencies() async{

    final List<Map<String, dynamic>> data =
    await AgenciesDataSourceNetwork.getAgencies();

    // récupérer la position de l'utilisateur
    final LocationModel userLocation =
    (await GeolocationDataSource.getLocation());
    // trier les agences par distance,
    // leur position GPS est fournie dans le json,
    // de la plus proche de userLocation a la plus eloignee


    // final List<AgencyModel> vehicles =
    // data.map((jsonVehicle) => AgencyModel.fromJson(jsonVehicle)).toList();
    //
    // return vehicles;




    List<AgencyModel> agencies =
    data.map((jsonVehicle) => AgencyModel.fromJson(jsonVehicle)).toList();

    // trier les agences par distance,
    // de la plus proche à la plus éloignée de l'utilisateur

    agencies.sort((a, b) => Geolocator.distanceBetween(userLocation.latitude,
        userLocation.longitude, a.latitude!, a.longitude!)
        .compareTo(Geolocator.distanceBetween(userLocation.latitude,
        userLocation.longitude, b.latitude!, b.longitude!)));

    return agencies;
  }

}
