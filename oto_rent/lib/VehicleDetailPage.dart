import 'package:flutter/material.dart';

class VehicleDetailPage extends StatelessWidget {
  final Map<String, dynamic> vehicle;

  const VehicleDetailPage({Key? key, required this.vehicle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${vehicle['mark']} ${vehicle['model']}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              vehicle['pic'],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailCard('Marque', '${vehicle['mark']}',
                      Icons.directions_car),
                  _buildDetailCard('Modèle', '${vehicle['model']}',
                      Icons.category),
                  _buildDetailCard('0 à 100', '${vehicle['zeroto100']}s',
                      Icons.speed),
                  _buildDetailCard('Classe énergétique',
                      '${vehicle['energyClass']}', Icons.bolt),
                  _buildDetailCard('Puissance', '${vehicle['power']} ch.',
                      Icons.flash_on),
                  _buildDetailCard('Vitesse maximale',
                      '${vehicle['topspeed']} km/h.', Icons.speed),
                  _buildDetailCard('Location', '${vehicle['location']}',
                      Icons.location_on),
                  _buildDetailCard('Prix', '${vehicle['price']}€', Icons.euro),
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
