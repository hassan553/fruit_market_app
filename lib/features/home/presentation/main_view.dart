import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/features/home/view_model/home_cubit.dart';
import 'package:fruit_market_app/features/home/widget/custom_bottom_bar.dart';
import 'package:icons_plus/icons_plus.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
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
  }
}
