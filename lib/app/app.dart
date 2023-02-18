import 'dart:math';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/core/uitls/app_theme.dart';
import 'package:fruit_market_app/features/home/presentation/main_view.dart';
import 'package:fruit_market_app/features/home/presentation/vegetables/bloc/vegetables_bloc.dart';
import 'package:fruit_market_app/features/home/services/local_database/local_data.dart';
import 'package:fruit_market_app/features/onboarding/views/splash.dart';
import '../features/home/presentation/dry_fruit/bloc/dry_fruit_bloc.dart';
import '../features/home/presentation/fruit/bloc/fruit_bloc.dart';
import '../features/home/view_model/home_cubit.dart';

import '../localization/local_controller.dart';
import 'package:get/get.dart';

class FruitMarket extends StatelessWidget {
  const FruitMarket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalController localController = Get.put(LocalController());
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()..getCurrentUser()),
        BlocProvider(
          create: (context) => DryFruitBloc()
            ..add(GetOrganicDryFruitEvent())
            ..add(GetMixedDryFruitEvent()),
        ),
        BlocProvider(
          create: (context) => FruitBloc()
            ..add(GetOrganicFruitEvent())
            ..add(GetMixedFruitEvent())
            ..add(GetStoneFruitEvent())
            ..add(GetMelonsFruitEvent()),
        ),
        BlocProvider(
          create: (context) => VegetablesBloc()
            ..add(GetOrganicVegetablesEvent())
            ..add(GetMixedVegetablesEvent())
            ..add(GetRootVegetablesEvent())
            ..add(GetAlliumVegetablesEvent()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          title: 'Fruit Market ',
          theme: lightTheme(),
          debugShowCheckedModeBanner: false,
          locale: localController.initailLocal,
          home: const SplashView(),
        ),
      ),
    );
  }
}
