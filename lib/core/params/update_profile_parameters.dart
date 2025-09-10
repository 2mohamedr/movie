class UpdateProfileParameters {
  final String name;
  final String phone;
  final String avatarId;

  UpdateProfileParameters({
    required this.name,
    required this.phone,
    required this.avatarId,
  });

  Map<String, dynamic> toJson() {
    return {"name": name, "phone": phone, "avaterId": avatarId};
  }
}
