class Failure {
  final String statusCode;
  final String message;

  Failure({required this.statusCode, required this.message});

  factory Failure.fromJson(Map<String, dynamic> map) {
    return Failure(
      statusCode: map['statusCode'].toString(),
      message: map['message'],
    );
  }
}
