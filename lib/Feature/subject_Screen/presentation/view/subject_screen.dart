import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Feature/subject_Screen/presentation/manager/user_cubit.dart';
import 'package:graduation_project/Feature/subject_Screen/presentation/manager/user_state.dart';
import 'package:graduation_project/Feature/subject_Screen/presentation/view/widget/custom_container_instractor.dart';
import 'package:graduation_project/core/Services/shared_preference_services.dart';
import 'package:graduation_project/core/Utils/colors_manager.dart';
import 'package:graduation_project/core/Utils/constant_manager.dart';
import 'package:graduation_project/core/Utils/font_manager.dart';
import 'package:graduation_project/core/Widget/custom_subject_card.dart';
import 'package:graduation_project/core/Widget/extract_role.dart';
import 'package:graduation_project/core/routes_manager/page_routes.dart';
import 'package:graduation_project/di/di.dart';

import '../../../../core/Widget/custom_diaolg.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  Widget build(BuildContext context) {
    var viewModel = getIt.get<UserViewModel>();
    return BlocConsumer<UserViewModel, UserState>(
      bloc: viewModel..fetchUser(),
      listener: (context, state) {
        if (state is StudentErrorState) {
          DialogUtils.showMessage(
            context: context,
            message: state.errorMessage,
            title: 'Error',
            postActionName: 'OK',
          );
        }
        if (state is InstructorErrorState) {
          DialogUtils.showMessage(
            context: context,
            message: state.errorMessage,
            title: 'Error',
            postActionName: 'OK',
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorsManager.whiteColor,
          appBar: AppBar(
            foregroundColor: ColorsManager.whiteColor,
            // leading: Builder(
            //   builder: (context)=>IconButton(
            //     onPressed: (){
            //       viewModel.fetchUserInfo();
            //       Scaffold.of(context).openDrawer();
            //     },
            //     icon: Icon(Icons.menu,color: ColorsManager.whiteColor,
            //     ),
            //   ),
            // ) ,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none_outlined,
                  color: ColorsManager.whiteColor,
                ),
              ),
            ],
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Subjects',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: ColorsManager.whiteColor,
                      fontSize: FontSize.s20,
                      fontWeight: FontWeightManager.medium,
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: ColorsManager.cayn,
          ),
          drawer: Drawer(

            backgroundColor: ColorsManager.whiteColor,
            child:
                state is UserInfoLoadingState
                    ? Center(child: CircularProgressIndicator())
                    : state is UserInfoSuccessState
                    ? Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                      'assets/images/profilePhoto.png',
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      color: ColorsManager.blackColor,
                                    ),
                                    onPressed:
                                        () => Navigator.of(context).pop(),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Name',
                                style: TextStyle(
                                  color: ColorsManager.blackColor,
                                  fontSize: FontSize.s16,
                                  fontWeight: FontWeightManager.semiBold,
                                ),
                              ),
                              Text(
                                state.userInfoEntity.name.toString(),
                                style: TextStyle(
                                  color: ColorsManager.gray,
                                  fontSize: FontSize.s16,
                                  fontWeight: FontWeightManager.medium,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Email Address',
                                style: TextStyle(
                                  color: ColorsManager.blackColor,
                                  fontSize: FontSize.s16,
                                  fontWeight: FontWeightManager.semiBold,
                                ),
                              ),
                              Text(
                                state.userInfoEntity.email.toString(),
                                style: TextStyle(
                                  fontSize: FontSize.s16,
                                  fontWeight: FontWeightManager.medium,
                                  color: ColorsManager.gray,
                                ),
                              ),
                              SizedBox(height: 20),
                              TextButton.icon(
                                label: Text(
                                  'Sign out',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: FontSize.s16,
                                    fontWeight: FontWeightManager.medium,
                                  ),
                                ),
                                icon: Icon(Icons.logout, color: Colors.blue),
                                onPressed: () {
                                  SharedPreferenceServices.deleteToken(
                                    AppConstants.token,
                                  );
                                  Navigator.popAndPushNamed(
                                    context,
                                    PagesRoutes.login,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                    : SizedBox.shrink(),
          ),
          onDrawerChanged: (isOpened) {
            isOpened ?
            viewModel.fetchUserInfo()
                : viewModel.fetchUser();
          },
          body:
              JwtHelper.extractRole() == AppConstants.student
                  ? state is StudentLoadingState ||
                          state is StudentCourseDetailsLoadingState
                      ? Center(child: CircularProgressIndicator())
                      : state is StudentSuccessState &&
                              viewModel.studentCourses.isNotEmpty &&
                              state.studentDataEntity.count!.toInt() > 0 ||
                          state is StudentCourseDetailsSuccessState
                      ? SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: List.generate(
                              viewModel.studentCourses.length,
                              (index) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return CustomSubjectCard(
                                      attendanceCount:
                                          viewModel.courseDetails?.attendance
                                              ?.toInt() ??
                                          0,
                                      totalDays:
                                          viewModel.courseDetails?.totalDays
                                              ?.toInt() ??
                                          0,
                                      title:
                                          viewModel.studentCourses[index].name
                                              .toString(),
                                      isExpanded:
                                          index == viewModel.expandedIndex,
                                      onTap: () {
                                        viewModel.fetchCourseDetails(
                                          viewModel.studentCourses[index].id!
                                              .toInt(),
                                        );
                                        setState(() {
                                          viewModel.expandedIndex =
                                              (viewModel.expandedIndex == index)
                                                  ? -1
                                                  : index;
                                        });
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      )
                      : Center(
                        child: Text(
                          'No Courses Found For You',
                          style: TextStyle(
                            color: ColorsManager.blackColor,
                            fontSize: FontSize.s16,
                            fontWeight: FontWeightManager.semiBold,
                          ),
                        ),
                      )
                  : state is InstructorErrorState
                  ? Center(child: CircularProgressIndicator())
                  : state is InstructorSuccessState &&
                      viewModel.instructorCourses.isNotEmpty &&
                      state.instructorDataEntity.count!.toInt() > 0
                  ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: List.generate(
                          viewModel.instructorCourses.length,
                          (index) {
                            // Create 6 items, the first one is expanded
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  PagesRoutes.attendanceScreen,
                                  arguments: viewModel.instructorCourses[index],
                                );
                              },
                              child: CustomContainerInstructor(
                                text:
                                    viewModel.instructorCourses[index].name
                                        .toString(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  )
                  : Center(
                    child: Text(
                      'No Courses Found For You',
                      style: TextStyle(
                        color: ColorsManager.blackColor,
                        fontSize: FontSize.s16,
                        fontWeight: FontWeightManager.semiBold,
                      ),
                    ),
                  ),
        );
      },
    );
  }
}
