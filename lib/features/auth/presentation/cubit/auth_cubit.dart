import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/user_entity.dart';
import '../../domain/use_case/forget_password_usecase.dart';
import '../../domain/use_case/sign_in_usecase.dart';
import '../../domain/use_case/sign_up_usecase.dart';
import 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;

  AuthCubit(this.signInUseCase, this.signUpUseCase, this.forgotPasswordUseCase)
    : super(AuthInitial());

  void signIn(UserEntity user) async {
    emit(AuthLoading());
    final result = await signInUseCase(user.email ?? '', user.password ?? '');
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (user) => emit(AuthSuccess(user)),
    );
  }

  void signUp(UserEntity user) async {
    emit(AuthLoading());
    final result = await signUpUseCase(
      email: user.email ?? '',
      password: user.password ?? '',
      confirmPassword: user.password ?? '',
      name: user.name ?? '',
      phoneNumber: user.phone ?? '',
      avatarId: user.avatarId ?? 1,
    );
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (user) => emit(AuthSuccess(user)),
    );
  }

  void forgotPassword(String email) async {
    emit(AuthLoading());
    final result = await forgotPasswordUseCase(email);
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (message) => emit(AuthForgotPasswordSuccess(message)),
    );
  }
}
