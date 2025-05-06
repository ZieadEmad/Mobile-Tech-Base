import 'package:arch/core/helpers/build_config.dart';
import 'package:arch/core/network/dio_service.dart';
import 'package:arch/core/theme/theme.dart';
import 'package:arch/injection_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


void main() {
  BuildConfig.flavor = Flavor.production;
  appMain();
}


void appMain() async{
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) async {
    if(kDebugMode){
      print('FlutterError: ${details.exception}');
      print('StackTrace: ${details.stack}');
    }
  };
  await setupLocator();
  await InjectionContainer.locator<NetworkService>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.instance.lightTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

