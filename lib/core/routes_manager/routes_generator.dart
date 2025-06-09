import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Feature/attendance/view/attendance_screen.dart';
import 'package:graduation_project/Feature/session_screen/view/session_screen.dart';
import 'package:graduation_project/Feature/splash_screen/splash_screen.dart';
import 'package:graduation_project/Feature/subject_Screen/presentation/manager/user_cubit.dart';
import 'package:graduation_project/core/routes_manager/page_routes.dart';
import 'package:graduation_project/di/di.dart';

import '../../Feature/attendance/manager/attendance_view_model.dart';
import '../../Feature/login/presentation/login_screen.dart';
import '../../Feature/subject_Screen/presentation/view/subject_screen.dart';

class RoutesGenerate {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
      case PagesRoutes.login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
          settings: settings,
        );
      case PagesRoutes.subjectScreen:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt.get<UserViewModel>(),
                child: SubjectScreen(),
              ),
          settings: settings,
        );
      case PagesRoutes.sessionScreen:
        return MaterialPageRoute(
          builder: (context) => SessionScreen(),
          settings: settings,
        );
      case PagesRoutes.attendanceScreen:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt.get<AttendanceViewModel>(),
                child: AttendanceScreen(),
              ),
          settings: settings,
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
        body: const Center(child: Text("Un defined route")),
      );
    },
  );
}
