import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final token = "FROM FLUTTER SECURED STORAGE";

final GoRouter allRoutes = GoRouter(
  // initialLocation: (token == null) ? Routes.login : Routes.layout,
  initialLocation: "/",
  navigatorKey: navigatorKey,
  routes: [
    // GoRoute(
    //   path: Routes.login.withSlash,
    //   name: Routes.login,
    //   builder: (context, state) => const LoginScreen(),
    // ),
    // GoRoute(
    //   path: "/",
    //   name: Routes.layout,
    //   builder: (context, state) => const LayoutScreen(),
    // ),
  ],
);
