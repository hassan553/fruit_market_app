import 'package:flutter/material.dart';
import 'package:fruit_market_app/features/home/presentation/home_view.dart';

import '../features/auth/screens/login_screen.dart';

class AppRouting {
  static String home = '/home';
  static String details = '/details';
  static String login = '/login';
  static String splash = '/splash';
}

Map<String, Widget Function(BuildContext)> routes = {
  AppRouting.home: (context) => const HomeView(),
  AppRouting.login: (context) =>  LoginView(),
  AppRouting.splash: (context) => const HomeView(),
};
