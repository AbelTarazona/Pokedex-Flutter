class ApiException implements Exception {
  final String detail;

  ApiException(this.detail);
}
