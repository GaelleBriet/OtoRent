import 'package:go_router/go_router.dart';
import 'package:oto_rent/views/agencies_view.dart';
import 'package:oto_rent/views/home_screen.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/agencies',
    routes: [
      GoRoute(
        path: '/agencies/:agencyId',
        name: HomeScreen.pageName,
        builder: (context, state) {
          final agencyId =
          int.tryParse(state.pathParameters['agencyId'] ?? '');

          return HomeScreen(agencyId: agencyId ?? -1, title: 'Oto Rent',);
        }),
      GoRoute(
        path: '/agencies',
        name: AgenciesView.pageName,
        builder: (context, state) => const AgenciesView(),
      )
    ],
  );
}
