import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/features/widgets/custom_button.dart';
import 'package:rakna/features/widgets/custom_text.dart';

import '../../../../core/functions/globle_functions.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../widgets/custom_text_field.dart';

class CarInfoView extends StatelessWidget {
  const CarInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenSize(context).width,
            height: screenSize(context).height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AppAssets.splash,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.grey,
                  AppColors.grey,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              children: [
                SizedBox(
                  height: screenSize(context).height * .1,
                ),
                CustomTextWidget(
                  text: 'My car',
                  fontSize: 18.sp,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  color: AppColors.black,
                  thickness: 4,
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextWidget(
                  text: 'Enter your car details',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: screenSize(context).height * .07,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomTextWidget(
                    text: 'Car number',
                    fontSize: 18.sp,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFieldWidget(
                  hintText: 'Enter your car number',
                  controller: TextEditingController(),
                ),
                SizedBox(
                  height: screenSize(context).height * .05,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomTextWidget(
                    text: 'Car model',
                    fontSize: 18.sp,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFieldWidget(
                  hintText: 'Enter your car model',
                  controller: TextEditingController(),
                ),
                SizedBox(
                  height: screenSize(context).height * .05,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomTextWidget(
                    text: 'Car color',
                    fontSize: 18.sp,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFieldWidget(
                  hintText: 'Enter your car color',
                  controller: TextEditingController(),
                ),
                SizedBox(
                  height: screenSize(context).height * .05,
                ),
                CustomButton(
                  function: () {},
                  text: 'Add Car',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
