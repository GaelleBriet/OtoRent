import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oto_rent/services/agencies_services.dart';

import '../models/agency_model.dart';

part 'agencies_state.dart';

class AgenciesCubit extends Cubit<AgenciesState>{

  AgenciesCubit() : super(AgenciesStateInitial());

    Future<void> fetchAgencies() async {
    emit(AgenciesStateLoading());

    try {
      final vehicles = await AgenciesServices.getAgencies();
      emit(AgenciesStateSuccess(vehicles));
    } catch (e) {
      emit(AgenciesStateError(e.toString()));
    }
  }
}