import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oto_rent/models/agency_model.dart';

import '../views/vehicles_view.dart';


class AgencyTile extends StatelessWidget {
  const AgencyTile({super.key, required this.agency});

  final AgencyModel agency;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {
                context.pushNamed(VehiclesView.pageName, pathParameters: {
                  'agencyId': agency.id.toString(),
                });
              },
              title: Text(
                agency.name ?? 'Nom inconnu',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8.0), // Add some space between the name and the row
            Row(
              children: [
                Expanded(
                  flex: 2, // GPS takes 20% of the width
                  child: Text(
                    'GPS: ${agency.latitude}, ${agency.longitude}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(width: 8.0), // Add some space between the GPS and the address
                Expanded(
                  flex: 8, // Address takes the remaining width
                  child: Text(
                    agency.address ?? 'Adresse inconnue',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

