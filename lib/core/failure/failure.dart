class Failure {
  final String statusCode;
  final String message;

  Failure({required this.statusCode, required this.message});

  factory Failure.fromJson(Map<String, dynamic> map) {
    final String errorMessage;
    if (map['message'] is List) {
      errorMessage = (map['message'] as List).join('\n');
    } else if (map['message'] is String) {
      errorMessage = map['message'];
    } else {
      errorMessage = "Unexpected Error";
    }
    return Failure(
      statusCode: map['statusCode'].toString(),
      message: errorMessage,
    );
  }
}
