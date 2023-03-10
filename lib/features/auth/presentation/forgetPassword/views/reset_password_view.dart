import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../../core/functions/globle_functions.dart';
import '../../../../../core/resources/app_assets.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../widgets/custom_text.dart';
import '../../login/views/login_view.dart';
import '../../login/widgets/build-rich_text.dart';
import '../manager/forget_passord_cubit.dart';
import 'done_message.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPassWordCubit, ForgetPassordState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
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
              padding: const EdgeInsets.all(30.0),
              child: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        text: 'Reset password ',
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: screenSize(context).height * .1,
                      ),
                      CustomTextFieldWidget(
                        controller:
                            ForgetPassWordCubit.get(context).passWordController,
                        hintText: 'via E-mail',
                        iconData: Icons.email_outlined,
                      ),
                      SizedBox(
                        height: screenSize(context).height * .02,
                      ),
                      CustomTextFieldWidget(
                        controller:
                            ForgetPassWordCubit.get(context).passWordController,
                        hintText: 'via E-mail',
                        iconData: Icons.email_outlined,
                      ),
                      SizedBox(
                        height: screenSize(context).height * .04,
                      ),
                      AnimatedCrossFade(
                        crossFadeState: CrossFadeState.showFirst,
                        secondChild: const Center(
                          child: CircularProgressIndicator(
                              color: AppColors.orange),
                        ),
                        firstChild: CustomButton(
                          function: () {
                            navigateTo(
                              context,
                              const DoneMessageView(
                                message:
                                    'The password\nhas been reset \n successfully',
                                screen: LoginView(),
                              ),
                            );
                          },
                          text: 'Confirm',
                        ),
                        duration: const Duration(
                          seconds: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
