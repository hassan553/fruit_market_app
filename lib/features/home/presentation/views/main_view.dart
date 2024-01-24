import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:fruit_market_app/core/functions/globle_functions.dart';
import 'package:fruit_market_app/features/home/presentation/widget/custom_bottom_bar.dart';
import 'package:lottie/lottie.dart';

import '../cubit/home_cubit.dart';


class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => Scaffold(
        bottomNavigationBar: CustomBottomBarWidget(
          onIconTap: (value) {
            HomeCubit.get(context).changeBottomNavigationCurrentIndex(value);
          },
          currentIndex: HomeCubit.get(context).bottomNavigationCurrentIndex,
        ),
        body: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            final bool connected = connectivity != ConnectivityResult.none;

            if (connected) {
              return HomeCubit.get(context)
                  .screens[HomeCubit.get(context).bottomNavigationCurrentIndex];
            } else {
              return Center(
                child: Lottie.asset(
                  'assets/animations/no_internet.json',
                  width: screenSize(context).width * .8,
                  height: 300,
                  fit: BoxFit.fill,
                ),
              );
            }
          },
          child: Container(),
        ),
      ),
    );
  }
}
