

import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes_manager/page_routes.dart';

import '../../login/presentation/login_screen.dart';

class RoutesGenerate {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.login :
       return MaterialPageRoute(
          builder: (context) =>const LoginScreen(), settings: settings
        );
      default:
        return unDefinedRoute();
    }
  }
}

Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Un defined route"),
          centerTitle: true,
        ),
        body: const Center(
          child: Text("Un defined route"),
        ),
      );
    },
  );
}
