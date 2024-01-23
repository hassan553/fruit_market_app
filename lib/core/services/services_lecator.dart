import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fruit_market_app/features/auth/data/repository/login_repository.dart';
import 'package:fruit_market_app/features/home/services/local_database/local_data.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repository/otp_repository.dart';
import '../../features/auth/data/repository/register_repository.dart';
import '../../features/home/services/home_repositry.dart/home_repository.dart';

GetIt gitIt = GetIt.instance;

class ServicesLector {
  static init() {
    gitIt.registerLazySingleton(() => LoginRepository());
    gitIt.registerLazySingleton(() => RegisterRepository());
    gitIt.registerLazySingleton(() => OTPRepository());
    gitIt.registerLazySingleton(() => HomeRepository());
    gitIt.registerLazySingleton(() => LocalDatabase());
    FirebaseAuth auth = FirebaseAuth.instance;
    gitIt.registerLazySingleton(() => auth);
  }
}
