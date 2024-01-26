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

  static Future<void> rentVehicle(int vehicleId, DateTime date) async {
    final Uri endpoint = Uri.parse('$baseUrl/rentals');
    const String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Mywicm9sZSI6InVzZXIiLCJpYXQiOjE2OTY1MDM1NjUsImV4cCI6MTY5NjUwNzE2NX0.jfnzEjC03TbL15-41g6mOYiB5rdtMRiMA_mVSU2MEdc';

    // création du body
    final body = {
      'vehicle_id': vehicleId,
      'day': date.toString(),
    };

    //création du header
    final header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    // envoi de la requête
    final http.Response response = await http.post(
      endpoint,
      headers: header,
      body: jsonEncode(body),
    );

    // vérification du code de retour
    if(response.statusCode != 200){
      throw Exception('Cannot rent vehicle $vehicleId - '
          '${response.statusCode} : ${response.body}'
      );
    }
  }
}