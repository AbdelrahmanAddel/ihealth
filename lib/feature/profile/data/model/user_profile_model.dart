import 'package:i_health/core/constants/firebase_strings.dart';
import 'package:i_health/feature/profile/domain/entitiy/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  final String password;
  UserProfileModel(
      {required this.password,
      required super.email,
      required super.phoneNumber,
      required super.fullName});
  factory UserProfileModel.fromJson(Map<String, dynamic> jsonData) {
    return UserProfileModel(
        password: jsonData[FireBaseString.password],
        email: jsonData[FireBaseString.email],
        phoneNumber: jsonData[FireBaseString.phoneNumber],
        fullName: jsonData[FireBaseString.fullName]);
  }
}
