import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../../core/functions/globle_functions.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../widgets/background_widget.dart';
import '../../../../widgets/custom_text.dart';
import '../../car_info/views/car_info.dart';
import '../../login/widgets/build-rich_text.dart';
import '../manager/register_cubit.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
        return Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: InkWell(
              onTap: () {
                pop(context);
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: AppColors.black,
                size: 30.sp,
              ),
            ),
          ),
          body: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: BackgroundWidget(
              child: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Form(
                      key: cubit.formKey,
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CustomTextWidget(
                              text: 'Create Your Account ',
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: screenSize(context).height * .03,
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
                            controller: cubit.addressController,
                            hintText: 'Address',
                            iconData: Icons.house,
                            keyboard: TextInputType.emailAddress,
                            valid: (value) {
                              if (value.isEmpty) {
                                return 'not valid empty value';
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
                          CustomTextFieldWidget(
                            controller: cubit.confirmPasswordController,
                            hintText: 'Confirm Password',
                            iconData: Icons.lock_open,
                            obscure: true,
                            valid: (value) {
                              if (value.isEmpty) {
                                return 'not valid empty value';
                              } else if (cubit.passwordController.text !=
                                  cubit.confirmPasswordController.text) {
                                return 'confirm password';
                              }
                            },
                          ),
                          SizedBox(
                            height: screenSize(context).height * .05,
                          ),
                          SizedBox(
                            width: screenSize(context).width,
                            child: CustomButton(
                              function: () {
                                // if (cubit.formKey.currentState!.validate()) {
                                //   navigateOff(context, const HomeView());
                                // }
                                navigateOff(context, const CarInfoView());
                              },
                              text: 'Create account',
                            ),
                          ),
                        ],
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
