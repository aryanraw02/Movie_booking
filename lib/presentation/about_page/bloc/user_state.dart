/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 11:23:13
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */
part of 'user_bloc.dart';

abstract class UserInfoState extends Equatable {
  const UserInfoState();

  @override
  List<Object> get props => [];
}

class UserInfoLoading extends UserInfoState {}

class UserInfoLoadingFail extends UserInfoState {}

class UserInfoEdit extends UserInfoState {
  final UserEntity userInfo;
  final bool isSuccess;
  final bool isFailure;

  const UserInfoEdit({
    required this.userInfo,
    this.isSuccess = false,
    this.isFailure = false,
  });

  /// Factory constructor for a failure state.
  factory UserInfoEdit.failure(UserEntity userInfo) {
    return UserInfoEdit(userInfo: userInfo, isFailure: true, isSuccess: false);
  }

  /// Factory constructor for a success state.
  factory UserInfoEdit.success(UserEntity userInfo) {
    return UserInfoEdit(userInfo: userInfo, isSuccess: true, isFailure: false);
  }

  /// Creates a copy with updated values.
  UserInfoEdit copyWith({
    UserEntity? userInfo,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return UserInfoEdit(
      userInfo: userInfo ?? this.userInfo,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
}
