import 'package:restaurant_application/core/network/dio_exception.dart';
import 'package:restaurant_application/core/result/failure/failure.dart';
import 'package:restaurant_application/core/result/result.dart';
import 'package:restaurant_application/core/result/success/success.dart';
import 'package:restaurant_application/services/data/datasources/authentication/authentication_service.dart';
import 'package:restaurant_application/services/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationService _authenticationService;
  const AuthenticationRepositoryImpl(this._authenticationService);

  @override
  Future<Result<dynamic>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authenticationService.signIn(
        body: {"email": email, "password": password},
      );
      if (response.statusCode == 200) {
        return Success(SuccessResult("", code: (response.statusCode ?? 0)));
      }
      return Error(
        ServerFailure("Failed to Signin", code: (response.statusCode ?? 0)),
      );
    } on HttpException catch (e) {
      return Error(ServerFailure(e.data, code: (e.statusCode)));
    }
  }
}
