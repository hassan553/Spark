import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakna/features/auth/forgetPassword/model_view/forget_passord_cubit.dart';
import 'package:rakna/features/auth/register/register/register_cubit.dart';

import '../core/resources/app_colors.dart';
import '../features/auth/login/view_model/login_cubit.dart';
import '../features/onboarding/views/splash.dart';

class Rakna extends StatelessWidget {
  const Rakna({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
           BlocProvider(
            create: (context) => ForgetPassWordCubit(),
          ),
          BlocProvider(
            create: (context) => RegisterCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: GoogleFonts.robotoMono().fontFamily,
            scaffoldBackgroundColor: AppColors.white,
          ),
          home: const SplashView(),
        ),
      ),
    );
  }
}
