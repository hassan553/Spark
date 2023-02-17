import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakna/core/resources/app_colors.dart';

import '../../widgets/background_widget.dart';
import '../manager/home_cubit.dart';
import '../widgets/custom_bottom_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          extendBody: false,
          body: cubit.screens[cubit.bottomNavigationCurrentIndex],
          bottomNavigationBar: BottomBarWidget(
            function: (index) {
              cubit.changeBottomNavigationCurrentIndex(index);
            },
            index: cubit.bottomNavigationCurrentIndex,
          ),
        );
      },
    );
  }
}
