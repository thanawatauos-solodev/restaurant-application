import 'package:dio/dio.dart';
import 'package:restaurant_application/core/network/dio_client.dart';
import 'package:restaurant_application/core/network/dio_exception.dart';

class AuthenticationService {
  final DioClient _dioClient;
  AuthenticationService(this._dioClient);

  Future<Response> signIn({required Map<String, dynamic> body}) async {
    try {
      final response = await _dioClient.post('/path', data: body);
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        throw HttpException(e.response!.statusCode!, e.response!.data);
      }
      throw NetworkException(e.message ?? "Unknown error");
    }
  }

  Future<Response> signUp({required Map<String, dynamic> body}) async {
    try {
      final response = await _dioClient.post('/path', data: body);
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        throw HttpException(e.response!.statusCode!, e.response!.data);
      }
      throw NetworkException(e.message ?? "Unknown error");
    }
  }
}
