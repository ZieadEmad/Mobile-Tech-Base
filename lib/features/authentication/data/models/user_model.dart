import 'package:arch/features/authentication/domain/entities/user_entity.dart';
import 'package:logger/logger.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.userId,
    required super.userName,
    required super.userEmail,
    required super.userToken,
  });

  factory UserModel.empty() => const UserModel(
    userId: null,
    userName: null,
    userEmail: null,
    userToken: null,
  );

  static UserModel fromJson(Map<String, dynamic> userData) {
    try {
      return UserModel(
        userId: userData['userId']?.toString() ?? '',
        userName: userData['userName']?.toString() ?? '',
        userEmail: userData['userEmail']?.toString() ?? '',
        userToken: userData['userToken']?.toString() ?? '',
      );
    } catch (e, st) {
      Logger().d(
        "Failed to parse $UserModel from data: $userData with error: $e and stacktrace: $st",
      );
      return UserModel.fromJson({});
    }
  }
}
