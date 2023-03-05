import 'package:get_it/get_it.dart';

import '../../features/auth/data/repository/login_repo.dart';

GetIt gitIt = GetIt.instance;

class ServicesLector {
  static init() {
    gitIt.registerLazySingleton(() => LoginRepositoryImpl());
  }
}
