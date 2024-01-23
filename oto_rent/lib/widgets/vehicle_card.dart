import "package:flutter/material.dart";
import "package:oto_rent/models/vehicle_model.dart";

class VehicleCard extends StatelessWidget {
  final VehicleModel vehicle;

  const VehicleCard({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(vehicle.picture, errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error);
        }),
        title: Text("${vehicle.brand} (${vehicle.model})"),
        subtitle: Text("${vehicle.price} €"),
      ),
    );
  }
}
