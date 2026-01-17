import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_application/core/local_storage/local_storage.dart';
import 'package:restaurant_application/navigation/route/constants/app_paths.dart';
import 'package:restaurant_application/features/splash/presentation/providers/splash_provider.dart';
import 'package:restaurant_application/features/splash/presentation/view_models/splash_view_model.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late final SplashViewModel _splashViewModel;

  @override
  void initState() {
    super.initState();
    _splashViewModel = ref.read(splashViewModelProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _splashViewModel.init();
      redirect();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;

    final token = await LocalStorage().getString('access_token');
    final targetPath = token != null ? AppPaths.home : AppPaths.login;

    if (!mounted) return;
    context.go(targetPath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Splash screen")));
  }
}
