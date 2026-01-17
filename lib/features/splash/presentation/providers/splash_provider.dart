import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_application/features/splash/presentation/view_models/splash_view_model.dart';

final splashViewModelProvider = AutoDisposeNotifierProvider<SplashViewModel, SplashState>(() => SplashViewModel());