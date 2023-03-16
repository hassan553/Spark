import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../widgets/background_widget.dart';
import '../../auth/presentation/login/views/login_view.dart';
import '../model_view/onboarding_cubit.dart';
import '../widgets/dots_widget.dart';
import '../../widgets/custom_button.dart';
import '../../../core/functions/globle_functions.dart';
import '../widgets/page_view.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = OnboardingCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: BackgroundWidget(
                child: Align(
                  alignment: AlignmentDirectional.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenSize(context).height * .1,
                      ),
                      PageViewWidget(
                        onboardingList: cubit.onBoardingStrings,
                        onPageChange: (value) {
                          cubit.changeCurrentIndex(value);
                        },
                        pageController: cubit.pageController,
                      ),
                      DotIndicator(
                        index: cubit.currentIndex.toDouble(),
                      ),
                      SizedBox(
                        height: screenSize(context).height * .03,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: CustomButton(
                          function: () {
                            if (cubit.currentIndex == 2) {
                              navigateOff(context, const LoginView());
                            } else {
                              cubit.checkCurrentIndex();
                            }
                          },
                          text:
                              cubit.currentIndex == 2 ? 'get_started'.tr : 'next'.tr,
                        ),
                      ),
                      SizedBox(
                        height: screenSize(context).height * .1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
