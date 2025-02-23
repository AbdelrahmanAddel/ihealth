class UserDataModel {
  final String fullName;
  final String email;
  final String password;
  final String phoneNumber;

  UserDataModel({
    required this.fullName,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'email': email,
      'password': password,
      'phone_number': phoneNumber,
    };
  }

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
    );
  }
}
