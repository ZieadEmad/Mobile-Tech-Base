import 'package:arch/app.dart';
import 'package:arch/core/data/network/utill/configration.dart';
import 'package:arch/core/presentation/theme/theme.dart';
import 'package:arch/core/routes/app_router.dart';
import 'package:arch/core/translations/codegen_loader.g.dart';
import 'package:arch/core/translations/locale_keys.g.dart';
import 'package:arch/injection/injection.dart';
import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
      path: 'assets/translations/',

      fallbackLocale: Locale('en'),
      child:  MyApp(),
    ),
  );
}
