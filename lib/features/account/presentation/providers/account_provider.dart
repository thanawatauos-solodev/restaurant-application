import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_application/features/account/presentation/view_models/account_view_model.dart';

final accountViewModelProvider = AutoDisposeNotifierProvider<AccountViewModel, AccountState>(() => AccountViewModel());