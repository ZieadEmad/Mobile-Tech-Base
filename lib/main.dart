import 'package:arch/core/core/data/network/utill/configration.dart';
import 'package:arch/core/core/presentation/theme/theme.dart';
import 'package:arch/injection/injection.dart';
import 'package:arch/translations/codegen_loader.g.dart';
import 'package:arch/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'translations/locale_keys.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(AppEnvironment.prod);
  await appMain();
}

 appMain() async {
  await EasyLocalization.ensureInitialized();
  FlutterError.onError = (details) async {
    if (kDebugMode) {
      print('FlutterError: ${details.exception}');
      print('StackTrace: ${details.stack}');
    }
  };
  runApp(
    EasyLocalization(
      useOnlyLangCode: true, // Use only language code for reading localization files
      useFallbackTranslations: true, // Enable fallback translations
      assetLoader: CodegenLoader(),
      supportedLocales: [Locale('ar'), Locale('en')],
      saveLocale: true,
      path: 'images/translations/',

      fallbackLocale: Locale('en'),
      child:  MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // key: ValueKey(context.locale.toString()),

      title: 'Flutter Demo',
      theme: AppTheme.instance.lightTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,

      locale: context.locale,
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text(LocaleKeys.welcome.tr())),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  context.setLocale(Locale('en'));
                },
                child: Text('en'),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  context.setLocale(Locale('ar'));
                },
                child: Text('ar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
