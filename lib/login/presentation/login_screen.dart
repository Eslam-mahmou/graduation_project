import 'package:flutter/material.dart';
import 'package:graduation_project/core/Utils/assets_manager.dart';
import 'package:graduation_project/core/Utils/colors_manager.dart';
import 'package:graduation_project/core/Utils/font_manager.dart';
import 'package:graduation_project/core/Utils/style_manager.dart';
import 'package:graduation_project/core/Widget/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
static const String loginScreen ='/login';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String userType = 'Student'; // Default selected type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.4,
              width:MediaQuery.of(context).size.width*1.4,
        
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(ImageAssets.cervycontainer),
        
                ),
              ),
               alignment: Alignment.center,
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        
            const SizedBox(height: 20),
        
            // Email & Password
            const CustomTextField(),

        
            const SizedBox(height:80),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'do you have a problem? ',
                  style: getTextStyle(14,FontWeightManager.medium, ColorsManager.blackColor),
                ),
                GestureDetector(
                  onTap: () {
                    // nav to admin
                  },
                  child: Text(
                    'Contact with us',
                    style: getTextStyle(14,FontWeightManager.medium, ColorsManager.cayn),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
