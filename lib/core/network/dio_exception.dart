class HttpException implements Exception {
  final int statusCode;
  final dynamic data;
  HttpException(this.statusCode, this.data);

  @override
  String toString() => 'HttpException: statusCode=$statusCode, data=$data';
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);

  @override
  String toString() => message;
}
