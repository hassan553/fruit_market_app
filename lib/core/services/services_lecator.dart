import 'package:fruit_market_app/features/auth/repository/login_repository.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/repository/otp_repository.dart';
import '../../features/auth/repository/register_repository.dart';
import '../../features/home/services/home_repositry.dart/home_repository.dart';

GetIt gitIt = GetIt.instance;

class ServicesLector {
  static init() {
    gitIt.registerLazySingleton(() => LoginRepository());
    gitIt.registerLazySingleton(() => RegisterRepository());
    gitIt.registerLazySingleton(() => OTPRepository());
    gitIt.registerLazySingleton(() => HomeRepository());
  }
}
