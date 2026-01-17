import 'package:go_router/go_router.dart';
import 'package:restaurant_application/features/splash/presentation/views/splash_screen.dart';
import 'package:restaurant_application/navigation/bottom_navigation/bottom_tabbar.dart';
import 'package:restaurant_application/navigation/route/constants/app_paths.dart';
import 'package:restaurant_application/features/table/presentation/views/table_screen.dart';
import 'package:restaurant_application/features/account/presentation/views/login_screen.dart';
import 'package:restaurant_application/features/account/presentation/views/register_screen.dart';

final List<RouteBase> appRoutes = [
  ShellRoute(
    builder: (context, state, child) => BottomTabbar(),
    routes: [
      GoRoute(
        path: AppPaths.home,
        name: AppRoutes.home,
        builder: (context, state) => const TableScreen(),
      ),
    ],
  ),

  GoRoute(
    path: AppPaths.register,
    name: AppRoutes.register,
    builder: (context, state) => const RegisterScreen(),
  ),
  GoRoute(
    path: AppPaths.login,
    name: AppRoutes.login,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: AppPaths.splash,
    name: AppRoutes.splash,
    builder: (context, state) => const SplashScreen(),
  ),
];
