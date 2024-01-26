import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:oto_rent/models/vehicle_model.dart";

import "../bloc/rental_cubit.dart";
import "../bloc/vehicle_cubit.dart";

class VehicleCard extends StatelessWidget {
  final VehicleModel vehicle;

  const VehicleCard({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => context.read<RentalCubit>().rent(vehicle.id ?? -1),
        leading: Image.network(vehicle.imageUrl!,
            errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error);
        }),
        title: Text("${vehicle.mark} (${vehicle.model})"),
        subtitle: Text("${vehicle.price} €"),
      ),
    );
  }
}
