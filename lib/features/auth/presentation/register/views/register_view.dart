import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../main.dart';
import '../../../../home/views/home_view.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../../core/functions/globle_functions.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../widgets/background_widget.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/snack_bar_widget.dart';
import '../../../controller/register_controller.dart';
import '../../car_info/views/car_info.dart';
import '../../login/widgets/build-rich_text.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: GetBuilder<RegisterController>(
                  init: RegisterController(),
                  builder: (controller) => Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: screenSize(context).height * .02,
                        ),
                        const BuildRichText(),
                        CustomTextWidget(
                          text: 'homeText8'.tr,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
                        SizedBox(
                          height: screenSize(context).height * .1,
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: CustomTextWidget(
                            text: 'homeText21'.tr,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: screenSize(context).height * .03,
                        ),
                        CustomTextFieldWidget(
                          controller: controller.nameController,
                          hintText: 'homeText22'.tr,
                          iconData: Icons.person,
                          keyboard: TextInputType.emailAddress,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'homeText23'.tr;
                            }
                          },
                        ),
                        SizedBox(
                          height: screenSize(context).height * .02,
                        ),
                        CustomTextFieldWidget(
                          controller: controller.emailController,
                          hintText: 'homeText11'.tr,
                          iconData: Icons.email_outlined,
                          keyboard: TextInputType.emailAddress,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'homeText23'.tr;
                            } else if (!value.contains('@gmail.com')) {
                              return 'homeText24'.tr;
                            }
                          },
                        ),
                        SizedBox(
                          height: screenSize(context).height * .02,
                        ),
                        // CustomTextFieldWidget(
                        //   controller: cubit.addressController,
                        //   hintText: 'Address',
                        //   iconData: Icons.house,
                        //   keyboard: TextInputType.emailAddress,
                        //   valid: (value) {
                        //     if (value.isEmpty) {
                        //       return 'not valid empty value';
                        //     }
                        //   },
                        // ),
                        // SizedBox(
                        //   height: screenSize(context).height * .02,
                        // ),
                        CustomTextFieldWidget(
                          controller: controller.passwordController,
                          hintText: 'homeText25'.tr,
                          iconData: Icons.lock,
                          obscure: true,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'homeText23'.tr;
                            } else if (value.length < 6) {
                              return 'homeText26'.tr;
                            }
                          },
                        ),
                        SizedBox(
                          height: screenSize(context).height * .02,
                        ),
                        CustomTextFieldWidget(
                          controller: controller.confirmPasswordController,
                          hintText: 'homeText27'.tr,
                          iconData: Icons.lock_open,
                          obscure: true,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'homeText23'.tr;
                            } else if (controller.passwordController.text !=
                                controller.confirmPasswordController.text) {
                              return 'homeText27'.tr;
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
                              // if (controller.formKey.currentState!.validate()) {

                              // }
                              navigateOff(context, const CarInfoView());
                              // cubit.userRegister(
                              //   email: cubit.emailController.text.trim(),
                              //   password:
                              //       cubit.passwordController.text.trim(),
                              //   phone: int.parse(cubit
                              //       .confirmPasswordController.text
                              //       .trim()),
                              //   name: cubit.nameController.text.trim(),
                              // );
                            },
                            text: 'homeText21'.tr,
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
      ),
    );
  }
}
/*
 showSnackBarWidget(
              context: context,
              message: 'Successfully Register',
              requestStates: RequestStates.success);
          sharedPreferences
              .setString('userModel', jsonEncode(state.userModel))
              .then((value) {
            print(value);
            navigateOff(context, const HomeView());
          });
        } else if (state is RegisterErrorState) {
          showSnackBarWidget(
              context: context,
              message: 'Error In Register',
              requestStates: RequestStates.error);
        }
 */