import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/Utils/colors_manager.dart';
import 'package:graduation_project/core/Utils/font_manager.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.brown,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Attendance' ,
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
              Container(
                height: 75,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorsManager.whiteColor,

                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        child: Image.asset('assets/images/profilePhoto.png'),
                      ),
                      SizedBox(width: 10,),


                      Expanded(
                        child: Column(

                          children: [
                            Column(
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('In: 9:00 am',
                                      style:GoogleFonts.roboto(
                                        textStyle:  TextStyle(
                                          color: ColorsManager.blackColor,
                                          fontSize: FontSize.s18,
                                          fontWeight: FontWeightManager.semiBold,

                                        ),
                                      ),
                                    ),
                                    Text('Out: 9:00 am',
                                      style: GoogleFonts.roboto(
                                        textStyle:  TextStyle(
                                          color: ColorsManager.blackColor,
                                          fontSize: FontSize.s18,
                                          fontWeight: FontWeightManager.semiBold,

                                        ),
                                      ),
                                    ),

                                  ],)

                              ],
                            ),
                          ],
                        ),
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
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      child: Image.asset('assets/images/profilePhoto.png'),
                    ),
                    SizedBox(width: 10,),


                    Expanded(
                      child: Column(

                        children: [
                          Column(
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('In: 9:00 am',
                                    style:GoogleFonts.roboto(
                                      textStyle:  TextStyle(
                                        color: ColorsManager.blackColor,
                                        fontSize: FontSize.s18,
                                        fontWeight: FontWeightManager.semiBold,

                                      ),
                                    ),
                                  ),
                                  Text('Out: 9:00 am',
                                    style: GoogleFonts.roboto(
                                      textStyle:  TextStyle(
                                        color: ColorsManager.blackColor,
                                        fontSize: FontSize.s18,
                                        fontWeight: FontWeightManager.semiBold,

                                      ),
                                    ),
                                  ),

                                ],)

                            ],
                          ),
                        ],
                      ),
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
