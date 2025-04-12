import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:graduation_project/core/Utils/assets_manager.dart';
import 'package:graduation_project/core/Utils/colors_manager.dart';
import 'package:graduation_project/core/Utils/font_manager.dart';
import 'package:graduation_project/core/Utils/style_manager.dart';
import 'package:graduation_project/core/Widget/custom_diaolg.dart';
import 'package:graduation_project/core/Widget/custom_login_button.dart';
import 'package:graduation_project/core/Widget/custom_text_field.dart';
import 'package:graduation_project/core/Widget/custom_validate.dart';
import 'package:graduation_project/core/Widget/extract_role.dart';
import 'package:graduation_project/core/routes_manager/page_routes.dart';
import 'package:graduation_project/di/di.dart';

import 'manager/login_state.dart';
import 'manager/login_view_model.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = getIt.get<LoginViewModel>();
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocConsumer<LoginViewModel, LoginState>(
            listener: (context, state) {
              if (state is LoginLoadingState) {
                EasyLoading.show();
              }
              if (state is LoginErrorState) {
                EasyLoading.dismiss();
                log(state.errMessage);
                DialogUtils.showMessage(context: context, message: state.errMessage,
                    title: "Error",
                postActionName: "OK",);
              }
              if (state is LoginSuccessState) {
                EasyLoading.dismiss();
                EasyLoading.showSuccess("Login Successfully",
                duration: Duration(milliseconds:1400 ));
                log(JwtHelper.extractRole().toString());
                Navigator.pushReplacementNamed(
                  context,
                  PagesRoutes.subjectScreen,
                );
              }
            },
            builder: (context, state) {
              return Form(
                key: viewModel.formKey,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 1.4,

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

                    CustomTextField(
                      hintText: "Email",
                      controller: viewModel.emailController,
                      validator: AppValidate.validateEmail,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    SizedBox(height: 24),
                    CustomTextField(
                      hintText: "Password",
                      controller: viewModel.passwordController,
                      validator: AppValidate.validatePassword,
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icon(Icons.lock_outlined),
                    ),
                    SizedBox(height: 20),
                    CustomLoginButton(
                      onPressed: () {
                        if (viewModel.formKey.currentState!.validate()) {
                          viewModel.login();
                        }
                      },
                      text: "Login",
                    ),

                    const SizedBox(height: 80),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'do you have a problem? ',
                          style: getTextStyle(
                            14,
                            FontWeightManager.medium,
                            ColorsManager.blackColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // nav to admin
                          },
                          child: Text(
                            'Contact with us',
                            style: getTextStyle(
                              14,
                              FontWeightManager.medium,
                              ColorsManager.cayn,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
