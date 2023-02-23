import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/core/functions/globle_functions.dart';
import 'package:fruit_market_app/features/home/view_model/home_cubit.dart';
import 'package:fruit_market_app/features/home/widget/custom_bottom_bar.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';

import '../../../core/uitls/app_colors.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: InternetConnectionChecker().hasConnection,
      builder: (context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.data == true) {
          return BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              var cubit = HomeCubit.get(context);
              return Scaffold(
                body: cubit.screens[cubit.bottomNavigationCurrentIndex],
                bottomNavigationBar: CustomBottomBarWidget(
                  onIconTap: (value) {
                    cubit.changeBottomNavigationCurrentIndex(value);
                  },
                  currentIndex: cubit.bottomNavigationCurrentIndex,
                ),
              );
            },
          );
        } else {
          return Scaffold(
            backgroundColor: AppColors.kPrimaryColor,
            body: Center(
              child: Lottie.asset(
                'assets/animations/no_internet.json',
                width: screenSize(context).width * .8,
                height: 300,
                fit: BoxFit.fill,
              ),
            ),
          );
        }
      },
    );
  }
}
