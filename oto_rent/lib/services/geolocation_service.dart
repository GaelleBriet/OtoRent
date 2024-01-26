import '../data/geolocation_data_source.dart';
import '../models/location_model.dart';

abstract class GeolocationService {
  static Future<Stream<LocationModel>> streamLocation() {
    return GeolocationDataSource.streamLocation();
  }
}
