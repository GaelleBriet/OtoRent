import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oto_rent/bloc/vehicle_cubit.dart';

import 'package:oto_rent/models/vehicle_model.dart';
import 'package:oto_rent/services/vehicle_services.dart';
import 'package:oto_rent/widgets/vehicle_list.dart';

import '../bloc/rental_cubit.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/fail_widget.dart';
import '../widgets/loading_widget.dart';

class VehiclesView extends StatelessWidget {
  final String title;

  const VehiclesView({super.key, required this.title, required this.agencyId,});

  static const String pageName = 'vehicles';

  final int agencyId;

  @override
  Widget build(BuildContext context) {
    final vehicles = context.read<VehicleCubit>().fetchVehicles(
        agencyId: agencyId);
    return Scaffold(
      appBar: AppBar(
          title: Text(title,
              style: const TextStyle(color: Color.fromARGB(255, 85, 33, 206))),
          elevation: 0,
          centerTitle: true),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) =>
            VehicleCubit()
              ..fetchVehicles(agencyId: agencyId),
          ),
          BlocProvider(
            create: (_) => RentalCubit(),
          ),
        ],
        child: BlocListener<RentalCubit, RentalState>(
          listener: (context, state) {
            if (state is RentalStateSuccess) {
              // snackbar success
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text('Véhicule loué !'),
                  ),
                );
            }
            if (state is RentalStateError) {
              // snackbar error
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text('Erreur !'),
                    backgroundColor: Colors.red,
                  ),
                );
            }
          },
          child: BlocBuilder<VehicleCubit, VehicleState>(
            builder: (context, state) {
              if (state is VehicleStateSuccess) {
                return VehicleList(vehicles: state.vehicles);
              } else if (state is VehicleStateError) {
                return FailWidget(
                  message: state.message,
                  onRetry: () => context
                      .read<VehicleCubit>()
                      .fetchVehicles(agencyId: agencyId),
                );
              }

              return const LoadingWidget();
              // if (state is VehicleStateLoading) {
              //   return const Center(child: CircularProgressIndicator());
              // } else if (state is VehicleStateSuccess) {
              //   // final vehicles = state.vehicles;
              //   return Column(
              //     children: [
              //       const Text("Liste des véhicules disponibles"),
              //       const SizedBox(height: 10),
              //       Expanded(child: VehicleList(vehicles: state.vehicles)),
              //     ],
              //   );
              // } else if (state is VehicleStateError) {
              //   return FailWidget(message: state.message, onRetry: () =>
              //       context
              //           .read<VehicleCubit>()
              //           .fetchVehicles(agencyId: agencyId),
              //   );
              // } else {
              //   return const LoadingWidget();
              // }
            },
          ),
        ),
      ),
      // bottomNavigationBar: const BottomNavBar(
      //   currentIndex: 0,
      // ),
    );
  }
}
