/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 11:20:51
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/helpers/is_valid.dart';
import 'package:cinema_booking/data/models/auth/edit_user_req.dart';
import 'package:cinema_booking/domain/entities/auth/user.dart';
import 'package:cinema_booking/domain/usecase/user/edit_user_info.dart';
import 'package:cinema_booking/domain/usecase/user/get_user.dart';
import 'package:cinema_booking/service_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  /// Initializes the bloc with an empty state.
  UserInfoBloc() : super(UserInfoLoading()) {
    on<LoadUserInfo>(_loadUserInfo);
    on<Submitted>(_onFormSubmitted);
  }

  /// Load UserInfo from FireBase
  Future<void> _loadUserInfo(
    LoadUserInfo event,
    Emitter<UserInfoState> emit,
  ) async {
    var response = await sl<GetUserUseCase>().call();

    response.fold(
      (l) {
        emit(UserInfoLoadingFail());
      },
      (r) {
        emit(UserInfoEdit(userInfo: r, isFailure: false, isSuccess: false));
      },
    );
  }

  Future<void> _onFormSubmitted(
    Submitted event,
    Emitter<UserInfoState> emit,
  ) async {
    final bool hasPassword =
        event.password != null && event.password!.isNotEmpty;
    final isValidEmail = Validators.isValidEmail(event.email);
    final isValidName = Validators.isValidName(event.displayName);

    bool isMatched = true;
    bool isConfirmPasswordValid = true;

    if (hasPassword) {
      isConfirmPasswordValid = Validators.isValidPassword(event.password!);
      isMatched = event.password == event.confirmPassword;
    }

    UserEntity user =
        state is UserInfoEdit
            ? (state as UserInfoEdit).userInfo
            : UserEntity(email: "", fullName: "", age: 18, gender: "Male");

    if (!isConfirmPasswordValid ||
        !isValidName ||
        !isValidEmail ||
        !isMatched) {
      emit(UserInfoEdit.failure(user));
      return;
    }

    user = UserEntity(
      email: event.email,
      fullName: event.displayName,
      gender: event.gender,
      age: event.age,
    );

    emit(UserInfoLoading());

    var result =
        await (hasPassword
            ? sl<EditUserInfoUseCase>().call(
              params: EditUserReq(
                email: event.email,
                fullName: event.displayName,
                password: event.password!,
                age: event.age,
                gender: event.gender,
              ),
            )
            : sl<EditUserInfoUseCase>().call(
              params: EditUserReq(
                email: event.email,
                fullName: event.displayName,
                age: event.age,
                gender: event.gender,
              ),
            ));

    result.fold(
      (l) => emit(UserInfoEdit.failure(user)),
      (r) => emit(UserInfoEdit.success(user)),
    );
  }
}
