import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_application/features/account/presentation/view_models/login_view_model.dart';

final loginViewModelProvider =
    AutoDisposeNotifierProvider<LoginViewModel, LoginState>(
      LoginViewModel.new,
    );
