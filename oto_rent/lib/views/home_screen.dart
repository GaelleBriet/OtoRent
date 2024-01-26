import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oto_rent/bloc/vehicle_cubit.dart';

import 'package:oto_rent/models/vehicle_model.dart';
import 'package:oto_rent/services/vehicle_services.dart';
import 'package:oto_rent/widgets/vehicle_list.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  const HomeScreen({super.key, required this.title,     required this.agencyId,});

  static const String pageName = 'vehicles';

  final int agencyId;

  @override
  Widget build(BuildContext context) {
    final vehicles = context.read<VehicleCubit>().fetchVehicles(agencyId: agencyId);
    return Scaffold(
      appBar: AppBar(
          title: Text(title,
              style: const TextStyle(color: Color.fromARGB(255, 85, 33, 206))),
          elevation: 0,
          centerTitle: true),
      body: BlocProvider(
        create: (_) => VehicleCubit()..fetchVehicles(agencyId: agencyId),
        child: BlocBuilder<VehicleCubit, VehicleState>(
          builder: (context, state) {

            if (state is VehicleStateLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is VehicleStateSuccess) {
              // final vehicles = state.vehicles;
            return Column(
              children: [
                const Text("Liste des véhicules disponibles"),
                const SizedBox(height: 10),
                Expanded(child: VehicleList(vehicles: state.vehicles)),
              ],
            );
            } else if (state is VehicleStateError) {
              return Column(
                children: [
                  Text(state.message),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<VehicleCubit>().fetchVehicles(agencyId: agencyId),
                    child: const Text('Réessayer'),
                  )
                ],
              );

            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
