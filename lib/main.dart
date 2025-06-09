import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:graduation_project/core/Services/shared_preference_services.dart';
import 'package:graduation_project/core/routes_manager/page_routes.dart';
import 'package:graduation_project/core/routes_manager/routes_generator.dart';
import 'core/Services/bloc_observer.dart';
import 'core/Services/easyLoading.dart';
import 'di/di.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ConfigLoading().showLoading();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
 await SharedPreferenceServices.init();
  runApp(const AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesGenerate.onGenerateRoute,
      initialRoute: PagesRoutes.splashScreen,
      builder: EasyLoading.init(),
    );
  }
}
