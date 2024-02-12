import 'package:go_router/go_router.dart';
import 'package:oto_rent/views/agencies_view.dart';
import 'package:oto_rent/views/vehicles_view.dart';

import 'package:oto_rent/views/all_vehicles_view.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/agencies',
    routes: [
      GoRoute(
        path: '/agencies/:agencyId',
        name: VehiclesView.pageName,
        builder: (context, state) {
          final agencyId =
          int.tryParse(state.pathParameters['agencyId'] ?? '');

          return VehiclesView(agencyId: agencyId ?? -1, title: 'Oto Rent',);
        }),
      GoRoute(
        path: '/agencies',
        name: AgenciesView.pageName,
        builder: (context, state) => const AgenciesView(),
      ),
      GoRoute(
        path: '/allVehicles',
        name: AllVehiclesView.pageName,
        builder: (context, state) => const AllVehiclesView(),
      )
    ],
  );
}
