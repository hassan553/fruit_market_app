import 'package:fruit_market_app/features/auth/repository/login_repository.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/repository/register_repository.dart';

GetIt gitIt = GetIt.instance;

class ServicesLector {
  static init() {
    gitIt.registerLazySingleton(() => LoginRepository());
    gitIt.registerLazySingleton(() => RegisterRepository());
  }
}
