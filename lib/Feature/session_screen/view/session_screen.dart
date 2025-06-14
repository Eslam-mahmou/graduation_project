import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:graduation_project/Feature/session_screen/manager/session_state.dart';
import 'package:graduation_project/Feature/session_screen/manager/session_view_model.dart';

import '../../../core/Utils/colors_manager.dart';
import '../../../core/Utils/font_manager.dart';
import '../../../core/Widget/custom_diaolg.dart';
import '../../../domain/entity/get_all_instructor_courses_response_entity.dart';

class SessionScreen extends StatelessWidget {
  const SessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<SessionViewModel>(context);
    var arg =
        ModalRoute.of(context)!.settings.arguments
            as InstructorCoursesListEntity;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,

          title: Text(
            arg.name.toString(),
            style: TextStyle(
              color: ColorsManager.blackColor,
              fontSize: FontSize.s20,
              fontWeight: FontWeightManager.bold,
            ),
          ),

        ),
        body: BlocConsumer<SessionViewModel, SessionState>(
          bloc: viewModel..startSession(arg.id?.toInt().toString()??"105"),
    listener: (context, state) {
      if (state is StartSessionLoadingState) {
        EasyLoading.show();
      }
      if (state is StartSessionErrorState) {
        EasyLoading.dismiss();
        log(state.errorMessage);
        DialogUtils.showMessage(
          context: context,
          message: state.errorMessage,
          title: "Error",
          postActionName: "OK",
          postAction: () {
            Navigator.pop(context);
            Navigator.pop(context);
            },
        );
      }
      if (state is StartSessionSuccessState) {
        EasyLoading.dismiss();
        EasyLoading.showSuccess(
          "Create Session Successfully",
          duration: Duration(milliseconds: 800),
        );

      }
    },
    builder: (context, state) {
      return Column(
         children: [],
        );
    },
    ),
      );
  }
}
