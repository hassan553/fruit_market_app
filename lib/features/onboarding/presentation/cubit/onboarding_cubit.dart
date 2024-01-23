import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../core/uitls/app_assets.dart';
import '../../data/model/onboarding_model.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  static OnboardingCubit get(context) => BlocProvider.of(context);

  PageController pageController = PageController();
  int currentIndex = 0;
  List<OnBoardingModel> onBoardingStrings = [
    OnBoardingModel(
      image: AppAssets.onboarding1,
      title: 'Looking Fro Items',
      subTitle:
          'Our new service makes it easy for you to buy  anything , there are new feature will really help you',
    ),
    OnBoardingModel(
      image: AppAssets.onboarding2,
      title: 'Easy Payments',
      subTitle: 'Hassle free payment to save your time ',
    ),
    OnBoardingModel(
      image: AppAssets.onboarding3,
      title: 'Send Items',
      subTitle:
          'send any item for you anywhere you are , it helps you to save your time ',
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
