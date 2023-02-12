import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/features/auth/login/presentation/widgets/build-rich_text.dart';
import 'package:rakna/features/widgets/background_widget.dart';

import '../../../core/functions/globle_functions.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_colors.dart';
import 'onboarding_view.dart';

class SplashTwoView extends StatefulWidget {
  const SplashTwoView({super.key});

  @override
  State<SplashTwoView> createState() => _SplashTwoViewState();
}

class _SplashTwoViewState extends State<SplashTwoView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      navigateOff(context, const OnBoardingView());
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  const Text(
                    'Welcome To',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  Image.asset(
                    AppAssets.hand,
                  ),
                ],
              ),
              SizedBox(
                height: 20.sp,
              ),
              const BuildRichText(),
              SizedBox(
                height: 20.sp,
              ),
              Text(
                '''The best parking application for all drivers to park their cars easily''',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
