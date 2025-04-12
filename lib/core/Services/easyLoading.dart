import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../Utils/colors_manager.dart';


class ConfigLoading {
  void showLoading() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..maskType = EasyLoadingMaskType.black
      ..textColor=ColorsManager.blackColor
      ..indicatorColor = Colors.black
      ..userInteractions = false
      ..dismissOnTap = true
      ..backgroundColor=ColorsManager.whiteColor;
  }
}