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
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(

        color: ColorsManager.whiteColor,
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


          SizedBox(height: 2,),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Start : 9:00 am', style: TextStyle(
                  color: ColorsManager.blackColor,
                  fontSize: FontSize.s14,
                  fontWeight: FontWeightManager.medium,

                ),),
                Text('Start : 9:00 am', style: TextStyle(
                  color: ColorsManager.blackColor,
                  fontSize: FontSize.s14,
                  fontWeight: FontWeightManager.medium,

                ),),

              ],),
          )

        ],
      ),
    );

  }
}
