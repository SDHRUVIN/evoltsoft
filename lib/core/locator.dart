import 'package:evoltsoft/core/services/navigation_service.dart';
import 'package:evoltsoft/data/local/user_preference.dart';
import 'package:get_it/get_it.dart';

import 'services/network/api_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  await UserPreference.getInstance();
  //     () => UserPreference.getInstance());
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerSingletonAsync<ApiService>(() => ApiService.getInstance());
}
