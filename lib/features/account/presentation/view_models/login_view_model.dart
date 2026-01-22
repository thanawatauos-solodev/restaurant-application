import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_application/core/result/result.dart';
import 'package:restaurant_application/services/di/repository_provider.dart';
import 'package:restaurant_application/services/domain/repositories/authentication_repository.dart';

class LoginState {
  final int? currentTab;
  const LoginState({this.currentTab});

  LoginState copyWith({int? currentTab}) =>
      LoginState(currentTab: currentTab ?? this.currentTab);
}

class LoginViewModel extends AutoDisposeNotifier<LoginState> {
  KeepAliveLink? _keepAliveLink;
  late final AuthenticationRepository _authenticationRepository;

  bool _didInit = false;
  @override
  LoginState build() {
    _authenticationRepository = ref.read(authenticationRepositoryProvider);
    _keepAliveLink ??= ref.keepAlive();
    return const LoginState();
  }

  Future<void> init() async {
    if (_didInit) return;
    _didInit = true;

    try {} catch (_) {
      _didInit = false;
    }
  }

  void clear() {
    state = const LoginState();
  }

  void onChangeTab(int index) {
    state = state.copyWith(currentTab: index);
  }

  Future<void> signIn({required String email, required String password}) async {
    final result = await _authenticationRepository.signIn(
      email: email,
      password: password,
    );

    result.fold((failure) {}, (succeess) {});
  }

  Future<void> signUp() async {}
}
