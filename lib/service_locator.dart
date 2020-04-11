import 'package:get_it/get_it.dart';

import 'models/LoginModel.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => LoginModel());
  locator.registerLazySingleton(() => AuthenticationService());

}