import 'package:restaurant_application/core/result/result.dart';

abstract class AuthenticationRepository {
  Future<Result<dynamic>> signIn({
    required String email,
    required String password,
  });
}
