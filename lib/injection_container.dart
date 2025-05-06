import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';


import 'core/network/dio_service.dart';
import 'features/authentication/auth_di.dart';

class InjectionContainer {
  static GetIt locator = GetIt.instance;

  InjectionContainer._();
}

Future<void> setupLocator() async {
  final sl = InjectionContainer.locator;
  // Shared

  sl.registerLazySingleton<NetworkService>(
    () => DioService(
      sl(),
    ),
  );

  // Register services here
  AuthDI().init();


  // cubits


  //use cases


  //core
  sl.registerLazySingleton<Dio>(
    () => Dio(),
  );

}
