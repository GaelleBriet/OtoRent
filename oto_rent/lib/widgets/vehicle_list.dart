import 'package:flutter/material.dart';
import 'package:oto_rent/widgets/vehicle_card.dart';
import '../VehicleDetailPage.dart';

class VehicleList extends StatelessWidget {
  const VehicleList({
    super.key,
    required this.vehicles,
  });

  final List vehicles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vehicles.length,
      // itemBuilder: (context, index) {
      //   final vehicle = vehicles[index];
      //   return VehicleCard(vehicle: vehicle);
      // },
      itemBuilder: (context, index) => VehicleCard(vehicle: vehicles[index]),
    );
  }
}
