import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_application/navigation/route/constants/app_paths.dart';
import 'package:restaurant_application/navigation/route/main/app_route.dart';

class RouteCheckObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    debugPrint("กำลัง push ไปหน้าซ: ${route.settings.name}");
  }
}

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

final GoRouter router = GoRouter(
  routes: [...appRoutes],
  initialLocation: AppPaths.splash,
  observers: [RouteCheckObserver(), routeObserver],
);
