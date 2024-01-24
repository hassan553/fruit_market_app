import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/core/services/services_lecator.dart';
import 'package:fruit_market_app/core/uitls/app_theme.dart';
import 'package:fruit_market_app/features/home/presentation/vegetables/bloc/vegetables_bloc.dart';
import 'package:fruit_market_app/features/home/data/local_database/local_data.dart';
import '../features/favourite/cubit/favorite_cubit.dart';
import '../features/home/presentation/cubit/home_cubit.dart';
import '../features/home/presentation/dry_fruit/bloc/dry_fruit_bloc.dart';
import '../features/home/presentation/fruit/bloc/fruit_bloc.dart';
import '../features/home/data/home_repositry.dart/home_repository.dart';
import '../features/home/presentation/views/main_view.dart';
import '../features/onboarding/presentation/views/splash.dart';
import '../localization/local_controller.dart';
import 'package:get/get.dart';

class FruitMarket extends StatelessWidget {
  const FruitMarket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalController localController = Get.put(LocalController());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HomeCubit(gitIt<HomeRepository>(), gitIt<HomeLocalDatabase>())
                ..getCurrentUser()
                ..getAllOrders(),
        ),
        BlocProvider(
          create: (context) =>
              FavoriteCubit(gitIt<HomeLocalDatabase>())..getAllFavorite(),
        ),
        BlocProvider(
          create: (context) => DryFruitBloc()
            ..add(GetIndehiscentDryFruitEvent())
            ..add(GetDehiscentDryFruitEvent())
            ..add(GetKashmiriDryFruitEvent())
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
          home: checkUserLogin(),
        ),
      ),
    );
  }

  Widget checkUserLogin() {
    return FirebaseAuth.instance.currentUser == null
        ? const SplashView()
        : const MainView();
  }
}
