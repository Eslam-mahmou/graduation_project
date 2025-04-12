import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/Utils/colors_manager.dart';
import 'package:graduation_project/core/Utils/font_manager.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.brown,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Courses' ,
          style: GoogleFonts.roboto(
              textStyle:
              TextStyle(
                color: ColorsManager.whiteColor,
                fontSize: FontSize.s20,
                fontWeight: FontWeightManager.medium,

              )
          ),

        ),
        backgroundColor: ColorsManager.cayn,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 75,
              width: double.infinity,
              decoration: BoxDecoration(

              color: ColorsManager.whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Cyber Security',
                      style: GoogleFonts.roboto(
                        textStyle:  TextStyle(
                          color: ColorsManager.blackColor,
                          fontSize: FontSize.s18,
                          fontWeight: FontWeightManager.semiBold,

                        ),
                      ),

                    ),


                    SizedBox(height: 2,),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Start : 9:00 am',
                            style:GoogleFonts.roboto(
                              textStyle:  TextStyle(
                              color: ColorsManager.blackColor,
                                fontSize: FontSize.s18,
                                fontWeight: FontWeightManager.semiBold,

                              ),
                            ),
                          ),
                          Text('End : 9:00 am',
                            style: GoogleFonts.roboto(
                              textStyle:  TextStyle(
                                color: ColorsManager.blackColor,
                                fontSize: FontSize.s18,
                                fontWeight: FontWeightManager.semiBold,

                              ),
                            ),
                          ),

                      ],),
                    )

                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 75,
              width: double.infinity,
              decoration: BoxDecoration(

                color: ColorsManager.whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Cyber Security',
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
              ),
            ),
          ],
        ),
      ),

    );
  }
}
