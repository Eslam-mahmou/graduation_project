import 'package:flutter/material.dart';

import '../Utils/font_manager.dart';
@immutable
class CustomLoginButton extends StatelessWidget {
   CustomLoginButton({super.key,required this.onPressed,required this.text});
   void Function()? onPressed;
   String text;
  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: FontSize.s16,
            fontWeight: FontWeightManager.medium,
          ),
        ),
      ),);
  }
}
