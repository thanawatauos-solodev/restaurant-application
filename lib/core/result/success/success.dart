class SuccessResult<T> {
  final T data;
  final int code;

  const SuccessResult(this.data, {this.code = 0});
}
