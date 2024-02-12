import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oto_rent/bloc/vehicle_cubit.dart';
import 'package:oto_rent/widgets/vehicle_list.dart';
import 'package:oto_rent/widgets/fail_widget.dart';
import 'package:oto_rent/widgets/loading_widget.dart';

import 'package:oto_rent/services/markdown_service.dart';

class AllVehiclesView extends StatelessWidget {
  const AllVehiclesView({super.key});

  static const String pageName = 'allVehicles';

  @override
  Widget build(BuildContext context) {

    final markdownService = MarkdownService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tous les véhicules',
            style: TextStyle(color: Color.fromARGB(255, 85, 33, 206))),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () async {
              final vehiclesCubit = context.read<VehicleCubit>();
              if (vehiclesCubit.state is VehicleStateSuccess) {
                final vehicles = (vehiclesCubit.state as VehicleStateSuccess).vehicles;
                final markdown = markdownService.generateMarkdown(vehicles);
                await markdownService.saveFile(markdown);
                final fileExists = await markdownService.fileExists('vehicles.md');
                print('File exists: $fileExists');
              }
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (_) => VehicleCubit()..fetchAllVehicles(),
        child: BlocBuilder<VehicleCubit, VehicleState>(
          builder: (context, state) {
            if (state is VehicleStateLoading) {
              return const LoadingWidget();
            }
            if (state is VehicleStateSuccess) {
              return VehicleList(vehicles: state.vehicles);
            }
            if (state is VehicleStateError) {
              return FailWidget(
                message: state.message,
                onRetry: () => context.read<VehicleCubit>().fetchAllVehicles(),
              );
            }
            return const SizedBox();
          },
        ),
      )
    );
  }
}
