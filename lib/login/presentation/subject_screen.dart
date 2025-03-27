import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/Utils/colors_manager.dart';
import 'package:graduation_project/core/Utils/font_manager.dart';
import 'package:graduation_project/core/Widget/custom_subject_card.dart';
import 'package:graduation_project/login/presentation/login_screen.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key});
static const String subject='/subject';

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  int expandedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      appBar: AppBar(

        leading: Builder(
            builder: (context)=>IconButton(
                onPressed: ()=>Scaffold.of(context).openDrawer(),
                icon: Icon(Icons.menu,color: ColorsManager.whiteColor,
                ),
            ),
        ) ,

        actions: [
          Icon(Icons.notifications_none_outlined,color: ColorsManager.whiteColor,),
          SizedBox(width: 10,),
        ],

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Subjects' ,
              style: GoogleFonts.roboto(
                textStyle:
                  TextStyle(
                    color: ColorsManager.whiteColor,
                    fontSize: FontSize.s20,
                    fontWeight: FontWeightManager.medium,

                  )
              ),

            ),
          ],
        ),
        backgroundColor: ColorsManager.cayn,
      ),
      drawer: Drawer(
        backgroundColor: ColorsManager.whiteColor,
        child: Column(
          children: [
            Container(

              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/profilePhoto.png'),
                      ),
                      IconButton(
                        icon: Icon(Icons.close,color: ColorsManager.blackColor),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Name',
                    style: TextStyle(
                      color:  ColorsManager.blackColor,
                      fontSize: FontSize.s16,
                      fontWeight: FontWeightManager.semiBold,
                    ),
                  ),
                  Text(
                    'Nada Essam',
                    style: TextStyle(
                      color:  ColorsManager.gray,
                      fontSize: FontSize.s16,
                      fontWeight: FontWeightManager.medium,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'ID',
                    style: TextStyle(
                      color:  ColorsManager.blackColor,
                      fontSize: FontSize.s16,
                      fontWeight: FontWeightManager.semiBold,
                    ),
                  ),
                  Text(
                    'C2100035',
                    style: TextStyle(
                      fontSize: FontSize.s16,
                      fontWeight: FontWeightManager.medium,
                      color:  ColorsManager.gray,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton.icon(
                    label: Text(
                      'Sign out',
                      style: TextStyle(color: Colors.blue,
                        fontSize: FontSize.s16,
                        fontWeight: FontWeightManager.medium,
                      ),
                    ),
                    icon: Icon(Icons.logout, color: Colors.blue),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, LoginScreen.login);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: List.generate(6, (index) {
              // Create 6 items, the first one is expanded
              return CustomSubjectCard(
                title: 'Data analysis',
                isExpanded: index == expandedIndex,
                onTap: () {
                  setState(() {
                    expandedIndex = (expandedIndex == index) ? -1 : index;
                  });
                },
              );
            }),
          ),
        ),
      ),

    );
  }
}
