import 'dart:math';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/core/services/services_lecator.dart';
import 'package:fruit_market_app/core/uitls/app_theme.dart';
import 'package:fruit_market_app/features/favourite/manager/favorite_cubit.dart';
import 'package:fruit_market_app/features/home/model/product_model.dart';
import 'package:fruit_market_app/features/home/presentation/main_view.dart';
import 'package:fruit_market_app/features/home/presentation/vegetables/bloc/vegetables_bloc.dart';
import 'package:fruit_market_app/features/home/services/local_database/local_data.dart';
import 'package:fruit_market_app/features/onboarding/views/onboarding_view.dart';
import 'package:print_color/print_color.dart';
import '../features/auth/screens/signup_screen.dart';
import '../features/home/presentation/dry_fruit/bloc/dry_fruit_bloc.dart';
import '../features/home/presentation/fruit/bloc/fruit_bloc.dart';
import '../features/home/services/home_repositry.dart/home_repository.dart';
import '../features/home/view_model/home_cubit.dart';

import '../features/onboarding/views/splash.dart';
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
          create: (context) => HomeCubit(gitIt<HomeRepository>(), gitIt<LocalDatabase>())
            ..getCurrentUser()
            ..getAllOrders(),
        ),
        BlocProvider(create: (context) => FavoriteCubit(gitIt<LocalDatabase>())..getAllFavorite(),),
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

class Text extends StatefulWidget {
  const Text({super.key});

  @override
  State<Text> createState() => _TextState();
}

class _TextState extends State<Text> {
  LocalDatabase localDatabase = LocalDatabase();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    localDatabase.create();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              () async {
                var result = await localDatabase.insert(
                  productModel: ProductModel(
                    id: 111,
                    name: 'hassan',
                    nutrition: ['12', 'a'],
                    price: 1,
                    image: 'image',
                    star: 1,
                  ),
                );
                result.fold((l) {
                  Print.cyan(l);
                }, (r) {
                  Print.green(r);
                });
              };
            });
          },
        ),
      ),
    );
  }
}
