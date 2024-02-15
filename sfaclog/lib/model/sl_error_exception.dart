class SLErrorException implements Exception {
  final String code;
  final String message;

  const SLErrorException({
    required this.code,
    required this.message,
  });

  @override
  String toString() {
    return message;
  }
}
