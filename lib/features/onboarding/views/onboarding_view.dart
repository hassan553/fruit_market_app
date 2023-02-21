import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/core/uitls/app_colors.dart';
import '../../auth/screens/login_screen.dart';
import '../../widgets/custom_text.dart';
import '../model_view/onboarding_cubit.dart';
import '../widgets/dots_widget.dart';
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
              child: Align(
                alignment: Alignment.center,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          DotIndicator(
                            index: cubit.currentIndex.toDouble(),
                          ),
                          const Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: MaterialButton(
                              color: AppColors.kPrimaryColor,
                              onPressed: () {
                                if (cubit.currentIndex == 2) {
                                  navigateOff(context, LoginView());
                                } else {
                                  cubit.checkCurrentIndex();
                                }
                              },
                              padding: const EdgeInsets.all(15),
                              child: CustomTextWidget(
                                text: cubit.currentIndex == 2
                                    ? 'Get Started'
                                    : 'Next',
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
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
        },
      ),
    );
  }
}
