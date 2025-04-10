import 'package:flutter/material.dart';

import '../Utils/font_manager.dart';
import '../Utils/style_manager.dart';

class DialogUtils {
  static showLoading({required BuildContext context, required String message}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
            content: Row(
              children: [
                const CircularProgressIndicator(
                  color: Colors.yellow,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          );
        });
  }

  static hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static showMessage(
      {required BuildContext context,
      required String message,
      String title = "",
      String? postActionName,
      void Function()? postAction,
      String? negativeActionName,
      void Function()? negativeAction}) {
    List<Widget>? actions = [];
    if (postActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            postAction?.call();
          },
          child: Text(
            postActionName,
            style: const TextStyle(color: Colors.yellow),
          )));
      if (negativeActionName != null) {
        actions.add(TextButton(
            onPressed: () {
              Navigator.pop(context);
              negativeAction?.call();
            },
            child: Text(
              negativeActionName,
              style: const TextStyle(color: Colors.yellow),
            )));
      }
    }

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Text(message,
                  style: getTextStyle(FontSize.s14, FontWeightManager.medium,
                      Colors.yellow)),
              title: Text(title),
              actions: actions);
        });
  }
}
