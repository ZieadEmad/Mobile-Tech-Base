import 'package:arch/app.dart';
import 'package:arch/main.dart';
import 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart'; // هذا هو الملف الذي سيُولد تلقائيًا

@AutoRouterConfig(replaceInRouteName: 'View,ViewRoute')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MyHomeViewRoute.page, initial: true),
  ];
}
