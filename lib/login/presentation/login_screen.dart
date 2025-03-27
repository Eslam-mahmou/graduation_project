import 'package:flutter/material.dart';
import 'package:graduation_project/core/Utils/assets_manager.dart';
import 'package:graduation_project/core/Utils/colors_manager.dart';
import 'package:graduation_project/core/Utils/font_manager.dart';
import 'package:graduation_project/core/Utils/style_manager.dart';
import 'package:graduation_project/core/Widget/custom_text_field.dart';
import 'package:graduation_project/login/presentation/subject_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String login = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.8,
              width: MediaQuery.of(context).size.width * 1.4,

              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                  image: AssetImage(ImageAssets.cervycontainer),
                ),
              ),
              child: Center(
                child: Text(
                  'Login',
                  style: getTextStyle(
                    25,
                    FontWeight.bold,
                    ColorsManager.whiteColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            CustomTextField(),
            SizedBox(height: 140),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('do you have a problem? '),


                GestureDetector(
                  onTap: () {

                    print('Contact us clicked');
                  },
                  child: Text(
                    'Contact with us',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: FontSize.s14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
