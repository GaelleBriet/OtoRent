import 'package:flutter/material.dart';
import 'package:oto_rent/models/vehicle_model.dart';

class VehicleDetailPage extends StatelessWidget {

  const VehicleDetailPage({Key? key, required this.vehicle}) : super(key: key);
  final VehicleModel vehicle;

  @override
  Widget build(BuildContext context) {
    final String brand = vehicle.brand ?? 'Marque inconnue';
    final String model = vehicle.model ?? 'Modèle inconnu';
    final String price = vehicle.price?.toString() ?? 'Prix inconnu';
    final String imageUrl = vehicle.imageUrl ?? 'Erreur';
    final String location =
    vehicle.location != null ? '${vehicle.location}' : 'Lieu inconnu';
    final String zeroTo100 = vehicle.zeroTo100?.toString() ?? 'Erreur';
    final String power = vehicle.power?.toString() ?? 'Erreur';
    final String topSpeed = vehicle.topSpeed?.toString() ?? 'Erreur';
    final String energyClass = vehicle.energyClass ?? 'Erreur';

    return Scaffold(
      appBar: AppBar(
        title: Text('$brand $model',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl ?? vehicle.imageUrl ?? "Erreur d'import de l'image",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailCard(
                      'Véhicule', '$brand $model', Icons.directions_car),
                  _buildDetailCard(
                      'Caractéristiques',
                      '0 à 100 : $zeroTo100 sec.,'
                          '\nPuissance : $power ch.,'
                          '\nVitesse max : $topSpeed km/h.,'
                          '\nClasse énergétique : $energyClass',
                      Icons.speed),
                  _buildDetailCard(
                      'Localisation', location, Icons.location_on),
                  _buildDetailCard('Prix', '$price€ / jour', Icons.euro),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard(String label, String value, IconData icon) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.grey[800],
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}
