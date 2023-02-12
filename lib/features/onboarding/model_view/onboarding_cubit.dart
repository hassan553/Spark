import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/resources/app_assets.dart';
import '../model/onboarding_model.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  static OnboardingCubit get(context) => BlocProvider.of(context);

  PageController pageController = PageController();
  int currentIndex = 0;
  List<OnBoardingModel> onBoardingStrings = [
    OnBoardingModel(
      image: AppAssets.logo,
      title: 'Best Parking Spots',
      subTitle: 'Find the best parking spots near you',
    ),
    OnBoardingModel(
      image: AppAssets.tap,
      title: 'Quick Navigation',
      subTitle: 'Navigate quickly in crowded garage',
    ),
    OnBoardingModel(
      image: AppAssets.payment,
      title: 'Easy Payments',
      subTitle: 'Hassle free payment to save your time ',
    ),
  ];
  changeCurrentIndex(index) {
    currentIndex = index;
    emit(ChangeCurrentIndexState());
  }

  checkCurrentIndex() {
    pageController.animateToPage(
      ++currentIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
    );
    emit(MoveNextPageState());
  }
}
