import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/core/uitls/app_assets.dart';
import 'package:fruit_market_app/features/home/model/collection_model.dart';
import 'package:fruit_market_app/features/home/model/product_model.dart';
import 'package:fruit_market_app/features/home/presentation/home_view.dart';

import '../../cart/presentation/views/cart_view.dart';
import '../../favourite/presentation/views/favourite_view.dart';
import '../../setting/presentation/views/setting_view.dart';
import '../services/home_repositry.dart/fruit_repositry.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 1;
  int bottomNavigationCurrentIndex = 0;
  List<String> categoriesString = ['Vegetables', 'Fruits', 'Dry fruits'];
  List<Widget> screens = const [
    HomeView(),
    CartView(),
    FavoriteView(),
    SettingView(),
  ];
  List<AppBar> appBarList = [
    AppBar(),
    AppBar(),
    AppBar(),
    AppBar(),
  ];
  List<String> carouselImagesList = [
    AppAssets.images4,
    AppAssets.images5,
    AppAssets.images6,
    AppAssets.images7,
  ];
  void changeCategoryIndex(int index) {
    currentIndex = index;
    emit(ChangeCurrentIndexState());
  }

  void changeBottomNavigationCurrentIndex(int index) {
    bottomNavigationCurrentIndex = index;
    emit(ChangeBottomNavigationCurrentIndexState());
  }

}
