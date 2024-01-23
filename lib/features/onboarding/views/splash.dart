import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/features/home/presentation/main_view.dart';
import 'package:fruit_market_app/features/onboarding/views/onboarding_view.dart';
import 'package:fruit_market_app/features/widgets/custom_text.dart';

import '../../../core/functions/globle_functions.dart';
import '../../../core/uitls/app_assets.dart';
import '../../../core/uitls/app_colors.dart';
import '../../auth/presentation/screens/login_screen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () => navigateOff(context,const  OnBoardingView()),
    );
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
    animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png'),
              AnimatedBuilder(
                animation: animationController,
                builder: (context, child) => AnimatedOpacity(
                  opacity: animationController.value,
                  duration: const Duration(milliseconds: 500),
                  child: CustomTextWidget(
                    text: 'Fruit Market',
                    color: AppColors.white,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
