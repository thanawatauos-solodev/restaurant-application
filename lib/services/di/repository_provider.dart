import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_application/core/network/dio_client.dart';
import 'package:restaurant_application/services/data/datasources/authentication/authentication_service.dart';
import 'package:restaurant_application/services/data/repositories/authentication/authentication_repository.dart';

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});

final authenticationRepositoryProvider = Provider((ref) {
  final dio = ref.read(dioClientProvider);
  return AuthenticationRepositoryImpl(AuthenticationService(dio));
});