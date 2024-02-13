import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/agencies_view.dart';
import '../views/all_vehicles_views.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex
    });

  final int currentIndex;

  void onTap(BuildContext context, int index) {
    if (index != currentIndex) {
      if (index == 0) {
        context.goNamed(AgenciesView.pageName);
      }
      if (index == 1) {
        context.goNamed(AllVehiclesView.pageName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(
          icon: Icon(Icons.real_estate_agent_outlined,
      ),
      label: 'Agences'
      ),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.car_rental,
          ),
          label: 'Véhicules'
      ),
    ],
      currentIndex: currentIndex,
      onTap: (index) => onTap(context, index),
    );
  }
}
