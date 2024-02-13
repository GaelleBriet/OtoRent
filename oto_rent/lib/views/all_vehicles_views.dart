import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oto_rent/bloc/vehicle_cubit.dart';
import 'package:oto_rent/widgets/bottom_nav_bar.dart';
import 'package:oto_rent/widgets/fail_widget.dart';
import 'package:oto_rent/widgets/loading_widget.dart';
import 'package:oto_rent/widgets/vehicle_list.dart';

import '../bloc/vehicle_cubit.dart';

class AllVehiclesView extends StatelessWidget {
  const AllVehiclesView({
    super.key,
  });

  static const String pageName = 'all-vehicles';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VehicleCubit()..fetchAllVehicles(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Oto Rent"),
              actions: [
                IconButton(
                  onPressed: () => context.read<VehicleCubit>().exportVehicles(),
                  icon: const Icon(
                    Icons.send,
                  ),
                )
              ],
            ),
            body: BlocBuilder<VehicleCubit, VehicleState>(
              builder: ( context,  state) {
                if (state is VehicleStateSuccess) {
                  return VehicleList(vehicles: state.vehicles);
                } else if (state is VehicleStateError) {
                  return FailWidget(
                    message: state.message,
                    onRetry: () => context.read<VehicleCubit>().fetchAllVehicles(),
                  );
                }

                return const LoadingWidget();
              },

            ),
            bottomNavigationBar: const BottomNavBar(currentIndex: 1),
          );
        }
      ),
    );
  }
}
