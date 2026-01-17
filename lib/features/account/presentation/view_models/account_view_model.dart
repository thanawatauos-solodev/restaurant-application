import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountState {
  const AccountState();

  AccountState copyWith() => const AccountState();
}

class AccountViewModel extends AutoDisposeNotifier<AccountState> {
  @override
  build() {
    return const AccountState();
  }

  Future<void> init() async {}

  void clear() {
    state = const AccountState();
  }
}
