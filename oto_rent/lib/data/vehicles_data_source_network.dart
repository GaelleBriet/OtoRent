import "dart:convert";
import "package:http/http.dart" as http;

abstract class VehiclesDataSourceNetwork  {
  static const baseUrl = 'http://localhost:3000';

  static Future<List<Map<String, dynamic>>> getVehicles() async {
    final Uri endpoint = Uri.parse('$baseUrl/vehicles');
    final http.Response response = await http.get(endpoint);

    if(response.statusCode != 200){
      throw Exception('Erreur durant la récupération des véhicules');
    }

    final List<dynamic> json = jsonDecode(response.body) as List<dynamic>;
    final List<Map<String, dynamic>> castedJson =
    json.cast<Map<String, dynamic>>();

    return castedJson;

    // final String body = response.body;
    // final List<dynamic> bodyList = jsonDecode(body) as List<dynamic>;
    //
    // return bodyList.cast<Map<String, dynamic>>();
  }
}