import 'package:flutter/material.dart';
import 'package:fruit_market_app/features/auth/presentation/views/signup_screen.dart';
import 'package:fruit_market_app/features/home/presentation/views/details_view.dart';
import 'package:fruit_market_app/features/onboarding/presentation/views/splash.dart';
import '../features/auth/presentation/views/login_screen.dart';
import '../features/home/presentation/views/home_view.dart';

class AppRouting {
  static String home = '/home';
  static String details = '/details';
  static String login = '/login';
  static String splash = '/splash';
  static String register = '/register';
}

Map<String, Widget Function(BuildContext)> routes = {
  AppRouting.home: (context) => const HomeView(),
  AppRouting.login: (context) => const LoginView(),
  AppRouting.register: (context) => const RegisterView(),
  AppRouting.splash: (context) => const SplashView(),
};
