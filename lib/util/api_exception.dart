class ApiException implements Exception {
  final String error;
  final int errorCode;
  ApiException({
    required this.error,
    required this.errorCode,
  });
}
