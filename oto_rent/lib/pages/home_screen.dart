import 'package:flutter/material.dart';
import 'package:oto_rent/services/vehicle_services.dart';
import '../component/vehicle_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Paramètres',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Une snackBar comme ça pour rien...')));
              },
              color: Colors.white,
            )
          ],
        ),
        body: VehicleList(
          vehicles: VehicleService.getVehicles(),
        ));
  }
}
