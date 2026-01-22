

import 'package:restaurant_application/core/result/failure/failure.dart';
import 'package:restaurant_application/core/result/success/success.dart';

sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final SuccessResult<T> success;
  const Success(this.success);
}

class Error<T> extends Result<T> {
  final FailureResult failure;
  const Error(this.failure);
}

extension ResultExtension<T> on Result<T> {
  bool get isSuccess => this is Success<T>;
  bool get isError => this is Error<T>;

  T? get data => isSuccess ? (this as Success<T>).success.data : null;
  FailureResult? get failure => isError ? (this as Error<T>).failure : null;
  int get code => switch (this) {
    Success<T>(:final success) => success.code,
    Error<T>(:final failure) => failure.code,
  };

  R fold<R>(
    R Function(FailureResult failure) onError,
    R Function(SuccessResult<T> success) onSuccess,
  ) {
    return switch (this) {
      Success<T>(:final success) => onSuccess(success),
      Error<T>(:final failure) => onError(failure),
    };
  }
}
