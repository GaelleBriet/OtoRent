import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oto_rent/bloc/vehicle_cubit.dart';

import 'package:oto_rent/views/home_screen.dart';

import 'core/router/app_router.dart';

void main() {
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Material Color blanc
  static const MaterialColor blanc = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VehicleCubit(),
      child: MaterialApp.router(
        title: "O'To Rent",
        theme: ThemeData(
          primarySwatch: blanc,
        ),
        // home: const HomeScreen(title: "O'To Rent"),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
