import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

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
   runApp(const FruitMarket());
  
}
