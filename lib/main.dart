import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:fruit_market_app/app/app.dart';
import 'package:fruit_market_app/core/services/services_lecator.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ServicesLector.init();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(FruitMarket());
  // runApp(
  // DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => FruitMarket(), // Wrap your app
  // ));
}
