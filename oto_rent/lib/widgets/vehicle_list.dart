import 'package:flutter/material.dart';

import 'package:oto_rent/widgets/vehicle_card.dart';
import 'package:oto_rent/models/vehicle_model.dart';

class VehicleList extends StatelessWidget {
  final List<VehicleModel> vehicles;

  const VehicleList({
    super.key,
    required this.vehicles,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vehicles.length,
      itemBuilder: (context, index) => VehicleCard(vehicle: vehicles[index]),
    );
  }
}
