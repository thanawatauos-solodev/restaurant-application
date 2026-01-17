import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashState {
  const SplashState();

  SplashState copyWith() => const SplashState();
}

class SplashViewModel extends AutoDisposeNotifier<SplashState> {
  @override
  build() {
    return const SplashState();
  }

  Future<void> init() async {}

  void clear() {
    state = const SplashState();
  }

}
