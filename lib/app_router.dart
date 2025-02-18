import 'package:blue_meth_registery/constants/routes.dart';
import 'package:blue_meth_registery/core/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => Homescreen());
    }
  }
}
