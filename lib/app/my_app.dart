import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakna/features/auth/forgetPassword/model_view/forget_passord_cubit.dart';
import 'package:rakna/features/auth/login/presentation/views/login_view.dart';
import 'package:rakna/features/auth/register/register/register_cubit.dart';
import 'package:rakna/features/home/manager/home_cubit.dart';
import 'package:rakna/features/home/views/home_view.dart';

import '../core/resources/app_colors.dart';
import '../features/auth/login/view_model/login_cubit.dart';
import 'package:device_preview/device_preview.dart';
import '../features/onboarding/views/splash_one.dart';

class Rakna extends StatelessWidget {
  const Rakna({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit(),
          ),
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
            primaryColor: AppColors.orange,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: AppColors.orange,
              unselectedItemColor: AppColors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedIconTheme: const IconThemeData(
                size: 30,
              ),
              unselectedIconTheme: const IconThemeData(
                size: 25,
              ),
            ),
          ),
          home: const HomeView(),
        ),
      ),
    );
  }
}
