import 'package:flutter/material.dart';
import 'package:oto_rent/models/agency_model.dart';

import 'agency_tile.dart';

class AgencyList extends StatelessWidget {
  const AgencyList({
    super.key,
    required this.agencies,
  });

  final List<AgencyModel> agencies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: agencies.length,
      itemBuilder: (context, index) {
        final agency = agencies.elementAt(index);

        return AgencyTile(agency: agency);
      },
    );
  }
}
