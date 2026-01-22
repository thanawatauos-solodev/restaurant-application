abstract class FailureResult {
  final dynamic message;
  final int code;
  final Object? data;

  const FailureResult(this.message, {this.code = 0, this.data});

  @override
  String toString() => 'Failure: $message';
}

class ServerFailure extends FailureResult {
  const ServerFailure(super.message, {super.code, super.data});
}

class UnknownFailure extends FailureResult {
  const UnknownFailure(super.message, {super.code});
}
