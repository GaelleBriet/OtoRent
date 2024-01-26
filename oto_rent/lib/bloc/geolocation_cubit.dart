import 'package:bloc/bloc.dart';


import '../models/location_model.dart';
import '../services/geolocation_service.dart';

part 'geolocation_state.dart';

class GeolocationCubit extends Cubit<GeolocationState> {
  GeolocationCubit() : super(GeolocationInitial());

  Future<void> listenLocation() async {
    emit(GeolocationStateLoading());

    try {
      // Récupération du stream
      final locationStream = await GeolocationService.streamLocation();

      locationStream.listen((location) {
        emit(GeolocationStateUpdated(location));
      });
    } catch (e) {
      print(e);
      emit(GeolocationStateError(e.toString()));
    }
  }
}
