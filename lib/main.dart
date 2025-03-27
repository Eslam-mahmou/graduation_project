import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes_manager/page_routes.dart';
import 'package:graduation_project/login/presentation/login_screen.dart';
import 'package:graduation_project/login/presentation/subject_screen.dart';

void main() {
  runApp(const AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.login,
      routes: {
        LoginScreen.login:(_)=> LoginScreen(),
        SubjectScreen.subject:(_)=> SubjectScreen(),
      },
    );
  }
}
