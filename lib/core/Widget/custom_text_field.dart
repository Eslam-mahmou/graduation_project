import 'package:flutter/material.dart';
import 'package:graduation_project/core/Utils/colors_manager.dart';
import 'package:graduation_project/core/Utils/font_manager.dart';
@immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.controller,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    required this.hintText,
    this.prefixIcon
  });

  TextEditingController? controller;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  bool obscureText;
  String hintText;
  Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontSize: FontSize.s16,
            fontWeight: FontWeight.w500,
          ),
          hintText:hintText ,
          prefixIcon:prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorsManager.blackColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorsManager.cayn, width: 2),
          ),
          errorStyle: TextStyle(color: Colors.red),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
        ),
      ),
    );
  }
}
