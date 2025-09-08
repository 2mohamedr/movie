class RegisterParameters {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;

  RegisterParameters({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "confirmPassword": confirmPassword,
      "avaterId": 1,
    };
  }
}
