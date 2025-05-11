import 'package:arch/core/data/network/dio_services.dart';
import 'package:arch/features/authentication/auth_di.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class InjectionContainer {
  static GetIt locator = GetIt.instance;
  InjectionContainer._();
}

Future<void> setupLocator() async {
  final sl = InjectionContainer.locator;
  // Shared

  sl.registerLazySingleton<NetworkService>(() => DioService(sl()));

  // Register services here
  AuthDI().init();

  // cubits

  //use cases

  //core
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<Logger>(() => Logger());
}
