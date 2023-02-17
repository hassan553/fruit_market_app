import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/features/auth/presentation/login_view.dart';
import 'package:fruit_market_app/features/home/presentation/main_view.dart';
import 'package:fruit_market_app/features/widgets/custom_text.dart';

import '../../../core/functions/globle_functions.dart';
import '../../../core/uitls/app_assets.dart';
import '../../../core/uitls/app_colors.dart';

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
      () => navigateOff(context, const LoginView()),
    );
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
    animationController.forward(from: 0);
  }

  Alignment alignment = Alignment.bottomCenter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: InkWell(
        onTap: () {
          navigateOff(context, const MainView());
        },
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: AnimatedBuilder(
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
              ),
              Positioned(
                bottom: -30,
                child: Image.asset(
                  AppAssets.splash,
                  width: screenSize(context).width,
                  fit: BoxFit.fill,
                  height: 250,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
