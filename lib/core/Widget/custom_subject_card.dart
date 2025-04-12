import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/Utils/colors_manager.dart';
import 'package:graduation_project/core/Utils/font_manager.dart';
import 'package:graduation_project/core/Widget/extract_attendance_precent.dart';

class CustomSubjectCard extends StatelessWidget {
  final String title;
  final bool isExpanded;
  final VoidCallback onTap;
final int totalDays;
final int attendanceCount;
  const CustomSubjectCard({
    Key? key,
    required this.title,
    required this.isExpanded,
    required this.onTap,
   required this.totalDays,
   required this.attendanceCount
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: ColorsManager.darkBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: GoogleFonts.roboto(
                textStyle:
                TextStyle(
                    fontWeight: FontWeightManager.medium,
                    fontSize: FontSize.s18,
                    color: Colors.white),
              ),
            ),
            trailing: Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            onTap: onTap,
          ),
          // Expanded content
          if (isExpanded)
            Container(
              padding: EdgeInsets.all(16.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Lectures',
                    style:  GoogleFonts.roboto(
                      textStyle:
                      TextStyle(
                          fontWeight: FontWeightManager.regular,
                          fontSize: FontSize.s16,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        extractNumberOfLectures(totalDays).toInt().toString(),
                        style:  GoogleFonts.roboto(
                          textStyle:
                          TextStyle(
                              fontWeight: FontWeightManager.semiBold,
                              fontSize: FontSize.s16,
                              color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: SliderTheme(
                          data: SliderThemeData(
                            trackHeight: 4,
                            activeTrackColor: Colors.red,
                            inactiveTrackColor: Colors.white.withOpacity(0.3),
                            thumbColor: Colors.white,
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
                          ),
                          child: Slider(
                            value:extractAttendancePrecent(totalDays, attendanceCount),
                            min: 0,
                            max: 100,
                            onChanged: (value){}, // Read-only slider
                          ),
                        ),
                      ),
                      Text(
                        "${extractAttendancePrecent(totalDays, attendanceCount).toInt()}%",
                        style:  GoogleFonts.roboto(
                          textStyle:
                          TextStyle(
                              fontWeight: FontWeightManager.semiBold,
                              fontSize: FontSize.s16,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Text(
                  //           'Days Attended',
                  //           style:  GoogleFonts.roboto(
                  //             textStyle:
                  //             TextStyle(
                  //                 fontWeight: FontWeightManager.medium,
                  //                 fontSize: FontSize.s16,
                  //                 color: Colors.white),
                  //           ),
                  //         ),
                  //         Text(
                  //           '110',
                  //           style:  GoogleFonts.roboto(
                  //             textStyle:
                  //             TextStyle(
                  //                 fontWeight: FontWeightManager.medium,
                  //                 fontSize: FontSize.s16,
                  //                 color: Colors.white),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Text(
                  //           'Days Absent',
                  //           style: GoogleFonts.roboto(
                  //             textStyle:
                  //             TextStyle(
                  //                 fontWeight: FontWeightManager.medium,
                  //                 fontSize: FontSize.s16,
                  //                 color: Colors.white),
                  //           ),
                  //         ),
                  //         Text(
                  //           '15',
                  //           style:  GoogleFonts.roboto(
                  //             textStyle:
                  //             TextStyle(
                  //                 fontWeight: FontWeightManager.medium,
                  //                 fontSize: FontSize.s16,
                  //                 color: Colors.white),
                  //           ),
                  //           ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}