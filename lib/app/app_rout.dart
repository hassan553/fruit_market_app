import 'package:flutter/material.dart';
import 'package:fruit_market_app/features/auth/presentation/complete_info_view.dart';
import 'package:fruit_market_app/features/auth/presentation/login_view.dart';
import 'package:fruit_market_app/features/home/presentation/home_view.dart';

class AppRouting{
  static String home='/home';
  static String details='/details';
  static String login='/login';
  static String completeInfo='/completeInfo';
  static String splash='/splash';
}
Map<String, Widget Function(BuildContext)> routes={
  AppRouting.home:(context)=>const HomeView(),
 
  AppRouting.login:(context)=>const LoginView(),
  AppRouting.completeInfo:(context)=>const CompleteInfoView(),
  AppRouting.splash:(context)=>const HomeView(),
};