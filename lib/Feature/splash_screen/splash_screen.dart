import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/Utils/assets_manager.dart';
import 'package:graduation_project/core/Utils/colors_manager.dart';
import 'package:graduation_project/core/routes_manager/page_routes.dart';

import '../../core/Services/shared_preference_services.dart';
import '../../core/Utils/constant_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var token = SharedPreferenceServices.getToken(AppConstants.token);
    var isRemember = SharedPreferenceServices.getToken(AppConstants.isRemember);
    Timer(
      Duration(milliseconds: 1500),
      () =>
          token != null && isRemember == true
              ? Navigator.pushReplacementNamed(
                context,
                PagesRoutes.subjectScreen,
              )
              : Navigator.pushReplacementNamed(context, PagesRoutes.login),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FadeInLeftBig(
            child: Text(
              "Student Attendance",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                color: ColorsManager.cayn,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FadeInRightBig(
            child: Image.asset(
              ImageAssets.appLogo,
              height: MediaQuery.of(context).size.height * .15,
              scale: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
