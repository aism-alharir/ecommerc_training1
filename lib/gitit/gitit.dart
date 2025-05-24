import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/datasource/datasource_auth.dart';
import '../data/repository/auth_repository.dart';

var locator = GetIt.instance;

Future<void> getInitit() async {
  await _initComponents();
  await _initDataSource();
  await _initRepository();
}

Future<void> _initComponents() async {
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
}

Future<void> _initDataSource() async {
  locator
      .registerFactory<IAuthenticationDatasource>(() => AuthenticationRemote());
}

Future<void> _initRepository() async {
  locator.registerFactory<IAuthRepository>(() => AuthenticationRepository());
}
