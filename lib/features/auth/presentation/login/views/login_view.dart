import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../widgets/background_widget.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/snack_bar_widget.dart';
import '../../../../../main.dart';

import '../../../../../core/functions/globle_functions.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../home/views/home_view.dart';
import '../../../../widgets/custom_text.dart';

import '../../../../widgets/loading.dart';
import '../../forgetPassword/views/forget_view.dart';
import '../../register/views/register_view.dart';
import '../manager/login_cubit.dart';
import '../widgets/build-rich_text.dart';
import '../widgets/build-socail_widget.dart';
import '../widgets/divider_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          showSnackBarWidget(
              context: context,
              message: 'Successfully Login',
              requestStates: RequestStates.success);
          sharedPreferences
              .setString('userModel', jsonEncode(state.userModel))
              .then((value) {
            print(value);
            navigateOff(context, const HomeView());
          });
        } else if (state is LoginErrorState) {
          showSnackBarWidget(
              context: context,
              message: 'Error In Login',
              requestStates: RequestStates.error);
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
          body: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SafeArea(
              child: BackgroundWidget(
                child: Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: screenSize(context).height * .02,
                            ),
                            const BuildRichText(),
                            CustomTextWidget(
                              text: 'Park your car ',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                            ),
                            SizedBox(
                              height: screenSize(context).height * .1,
                            ),
                            CustomTextFieldWidget(
                              controller: cubit.emailController,
                              hintText: 'Email address',
                              iconData: Icons.email_outlined,
                              keyboard: TextInputType.emailAddress,
                              valid: (value) {
                                if (value.isEmpty) {
                                  return 'not valid empty value';
                                } else if (!value.contains('@gmail.com')) {
                                  return 'not valid email ';
                                }
                              },
                            ),
                            SizedBox(
                              height: screenSize(context).height * .02,
                            ),
                            CustomTextFieldWidget(
                              controller: cubit.passwordController,
                              hintText: 'Password',
                              iconData: Icons.lock,
                              obscure: true,
                              valid: (value) {
                                if (value.isEmpty) {
                                  return 'not valid empty value';
                                } else if (value.length < 8) {
                                  return 'short password length ';
                                }
                              },
                            ),
                            SizedBox(
                              height: screenSize(context).height * .02,
                            ),
                            InkWell(
                              onTap: () {
                                navigateTo(context, const ForgetPasswordView());
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: CustomTextWidget(
                                  text: 'Forget Password ?',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenSize(context).height * .05,
                            ),
                            AnimatedCrossFade(
                              secondChild: const LoadingWidget(),
                              crossFadeState: state is LoginLoadingState
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild: SizedBox(
                                width: screenSize(context).width,
                                child: CustomButton(
                                  function: () {
                                    // if (formKey.currentState!.validate()) {
                                    //   cubit.userLogin(
                                    //       cubit.emailController.text.trim(),
                                    //       cubit.passwordController.text.trim());
                                    // }
                                    cubit.userLogin(
                                        cubit.emailController.text.trim(),
                                        cubit.passwordController.text.trim());
                                  },
                                  text: 'Sign In',
                                ),
                              ),
                              duration: const Duration(milliseconds: 500),
                            ),
                            SizedBox(
                              height: screenSize(context).height * .02,
                            ),
                            Row(
                              children: [
                                CustomTextWidget(
                                  text: "Don\'t have an account ? ",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.sp,
                                ),
                                InkWell(
                                  onTap: () {
                                    navigateTo(context, const RegisterView());
                                  },
                                  child: CustomTextWidget(
                                    text: "Sign Up",
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.orange,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenSize(context).height * .07,
                            ),
                            const DividerWidget(),
                            SizedBox(
                              height: screenSize(context).height * .05,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: BuildSocialWidget(
                                    iconData: FontAwesome.facebook,
                                    onTap: () {},
                                    text: 'Facebook',
                                  ),
                                ),
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: BuildSocialWidget(
                                    iconData: FontAwesome.google,
                                    onTap: () {},
                                    text: 'Google',
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
