import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:graduation_project/core/Services/shared_preference_services.dart';
import 'package:graduation_project/core/Utils/assets_manager.dart';
import 'package:graduation_project/core/Utils/colors_manager.dart';
import 'package:graduation_project/core/Utils/constant_manager.dart';
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                DialogUtils.showMessage(
                  context: context,
                  message: state.errMessage,
                  title: "Error",
                  postActionName: "OK",
                );
              }
              if (state is LoginSuccessState) {
                EasyLoading.dismiss();
                EasyLoading.showSuccess(
                  "Login Successfully",
                  duration: Duration(milliseconds: 1400),
                );
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                    Image.asset(ImageAssets.appLogo, scale: 1.5),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),

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
                      obscureText: true,
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
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 8),
                        StatefulBuilder(
                          builder: (context, setState) {
                            return Checkbox(
                              activeColor: ColorsManager.cayn,
                              value: viewModel.isRememberMe,
                              onChanged: (value) {
                                setState(() {
                                  viewModel.isRememberMe = value!;
                                  SharedPreferenceServices.saveToken(
                                    AppConstants.isRemember,
                                    viewModel.isRememberMe,
                                  );
                                });
                              },
                            );
                          },
                        ),
                        Text(
                          "Remember me?",
                          style: getTextStyle(
                            14,
                            FontWeightManager.regular,
                            ColorsManager.blackColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),

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
                        Text(
                          'Contact with us',
                          style: getTextStyle(
                            14,
                            FontWeightManager.medium,
                            ColorsManager.cayn,
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
