import 'package:flutter/material.dart';

import 'package:oto_rent/models/vehicle_model.dart';
import 'package:oto_rent/services/vehicle_services.dart';
import 'package:oto_rent/widgets/vehicle_list.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    List<VehicleModel> vehicles = VehicleServices.getVehicles();
    return Scaffold(
      appBar: AppBar(
          title: Text(title, style: const TextStyle(color: Color.fromARGB(255, 85, 33, 206))),
          elevation: 0,
          centerTitle: true),
      body: Column(
        children: [
          const Text("Liste des véhicules disponibles"),
          const SizedBox(height: 10),
          Expanded(child: VehicleList(vehicles: vehicles)),
        ],
      ),
    );
  }
}
