import 'package:geolocator/geolocator.dart';

import '../models/location_model.dart';

abstract class GeolocationDataSource {
  static Future<Stream<LocationModel>> streamLocation() async {
    // tester si le service de localisation est activé
    final isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      throw Exception('Location service is disabled.');
    }
    // demander la permission à l'utilisateur pour utiliser son gps
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permission is denied.');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permission is permanently denied, '
          'we cannot request permission.');
    }
    // retourne le flux de mise à jour de la position gps
    final positionStream = Geolocator.getPositionStream();
    return positionStream.map(
      (position) => LocationModel(
        latitude: position.latitude,
        longitude: position.longitude,
      ),
    );
  }
  // créer le getLocation()
  static Future<LocationModel> getLocation() async {
    // tester si le service de localisation est activé
    final isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      throw Exception('Location service is disabled.');
    }
    // demander la permission à l'utilisateur pour utiliser son gps
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permission is denied.');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permission is permanently denied, '
          'we cannot request permission.');
    }
    // retourne la position gps
    final position = await Geolocator.getCurrentPosition();
    return LocationModel(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}