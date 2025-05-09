
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? userId;
  final String? userName;
  final String? userEmail;
  final String? userToken;
  const UserEntity({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userToken,
  });

  UserEntity copyWith({
    UserEntity? userEntity,
  }) {
    return UserEntity(
      userId: userId,
      userName: userName,
      userEmail: userEmail,
      userToken: userToken,
    );
  }
  @override
  List<Object?> get props => [
    userId,
    userName,
    userEmail,
    userToken,
  ];

}
