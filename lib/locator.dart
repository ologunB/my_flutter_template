import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:spur/core/vms/restaurants_vm.dart';

import 'core/apis/auth_api.dart';
import 'core/apis/restaurants_api.dart';
import 'core/vms/auth_vm.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthApi());
  locator.registerFactory(() => AuthViewModel());
  locator.registerLazySingleton(() => RestaurantsApi());
  locator.registerFactory(() => RestaurantsViewModel());
}

final List<SingleChildWidget> allProviders = <SingleChildWidget>[
  ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
  ChangeNotifierProvider<RestaurantsViewModel>(
      create: (_) => RestaurantsViewModel()),
];
