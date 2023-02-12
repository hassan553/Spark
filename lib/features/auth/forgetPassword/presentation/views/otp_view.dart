import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/features/auth/forgetPassword/presentation/views/reset_password_view.dart';
import 'package:rakna/features/auth/login/presentation/widgets/build-rich_text.dart';
import 'package:rakna/features/auth/login/presentation/widgets/pin_code.dart';
import 'package:rakna/features/widgets/background_widget.dart';
import 'package:rakna/features/widgets/custom_button.dart';
import '../../../../../core/functions/globle_functions.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../widgets/custom_text.dart';

class OTPView extends StatelessWidget {
  const OTPView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                  CustomTextWidget(
                    text: 'Code Sent ! ',
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Container(
                    width: screenSize(context).width,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white30,
                    ),
                    child: Text(
                      ' Code has been sent to Email',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      // maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    height: screenSize(context).height * .06,
                  ),
                  const PinCodeWidget(),
                  SizedBox(
                    height: screenSize(context).height * .1,
                  ),
                  SizedBox(
                    width: screenSize(context).width,
                    child: AnimatedCrossFade(
                      crossFadeState: CrossFadeState.showFirst,
                      secondChild: const Center(
                        child:
                            CircularProgressIndicator(color: AppColors.orange),
                      ),
                      firstChild: CustomButton(
                        function: () {
                          navigateTo(context, const ResetPasswordView());
                        },
                        text: 'Verify',
                      ),
                      duration: const Duration(
                        seconds: 1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize(context).height * .02,
                  ),
                  Row(
                    children: [
                      CustomTextWidget(
                        text: "Didn't receive it ?",
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),
                      InkWell(
                        onTap: () {},
                        child: CustomTextWidget(
                          text: " Resend ",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
