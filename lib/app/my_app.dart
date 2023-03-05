import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../features/home/manager/home_cubit.dart';
import '../core/resources/app_colors.dart';
import '../features/auth/data/repository/login_repo.dart';
import '../features/auth/presentation/forgetPassword/manager/forget_passord_cubit.dart';
import '../features/auth/presentation/login/manager/login_cubit.dart';
import '../features/auth/presentation/register/manager/register_cubit.dart';
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
            create: (context) => LoginCubit(LoginRepositoryImpl()),
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
            fontFamily: GoogleFonts.robotoCondensed().fontFamily,
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
          home: const SplashOneView(),
        ),
      ),
    );
  }
}
