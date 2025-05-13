import 'package:arch/core/helper/translations/locale_keys.g.dart';
import 'package:arch/core/presentation/theme/app_theme.dart';
import 'package:arch/core/routes/app_router.dart';
import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme:themeLight(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: _appRouter.config(),
    );
  }
}

@RoutePage()
class MyHomeView extends StatelessWidget {
  const MyHomeView({super.key});

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
