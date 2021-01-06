class ApiResponse<T> {
  final String message;
  final T value;

  ApiResponse({this.message, this.value});
}
