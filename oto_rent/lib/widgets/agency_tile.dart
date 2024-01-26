import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oto_rent/models/agency_model.dart';

import '../views/vehicles_view.dart';


class AgencyTile extends StatelessWidget {
  const AgencyTile({super.key, required this.agency});

  final AgencyModel agency;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.pushNamed(VehiclesView.pageName, pathParameters: {
          'agencyId': agency.id.toString(),
        });
      },
      title: Text(agency.name ?? 'Nom inconnu'),
      subtitle: Text(agency.address ?? 'Adresse inconnue'),
      // ajouter latitude et longitude
      trailing: Text('Coordonées GPS :${agency.latitude}, '
          '${agency.longitude}'),
    );
  }
  }

