import 'package:flutter/cupertino.dart';

import '../../../../../core/Utils/colors_manager.dart';
import '../../../../../core/Utils/font_manager.dart';
@immutable
class CustomContainerInstructor extends StatelessWidget {
   CustomContainerInstructor({super.key,required this.text});
String text ;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorsManager.brown,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,
            style: TextStyle(
              color: ColorsManager.blackColor,
              fontSize: FontSize.s18,
              fontWeight: FontWeightManager.semiBold,

            ),
          ),
        ],
      ),
    );

  }
}
