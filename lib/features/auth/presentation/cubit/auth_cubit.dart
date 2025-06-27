import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_movie_app/features/auth/domain/entity/user_entity.dart';

import '../../domain/use_case/forget_password_usecase.dart';
import '../../domain/use_case/sign_in_usecase.dart';
import '../../domain/use_case/sign_up_usecase.dart';
import 'auth_state.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final SignUpUseCase _signUpUseCase;
  final SignInUseCase _signInUseCase;
  final ForgetPasswordUseCase _forgetPasswordUseCase;

  AuthCubit(this._signUpUseCase, this._signInUseCase, this._forgetPasswordUseCase) : super(AuthInitial());

 Future<void> signIn(UserEntity user) async {
    emit(AuthLoading());
    var response = await _signInUseCase(
      email: user.email!,
      password: user.password!,
    );
    response.fold(
      (l) {
        emit(AuthFailure(failure: l));
      },
      (r) {
        emit(AuthSuccess(userEntity: r));
      },
    );
  }
  Future<void > signUp(UserEntity user) async{

    emit(AuthLoading());
    var response =await _signUpUseCase(
      name: user.name!,
      email: user.email!,
      password: user.password!,
      phoneNumber: user.phone!,
    );
    response.fold(
      (l) {
        emit(AuthFailure(failure: l));
      },
      (r) {
        emit(AuthSuccess(userEntity: r));
      },
    );
  }

  Future<void> forgetPassword(String email) async {
    emit(AuthLoading());
    final response = await _forgetPasswordUseCase.call(email);
    response.fold(
          (failure) => emit(AuthFailure(failure: failure)),
          (message) => emit(AuthSuccess( userEntity: UserEntity(email: email))),
    );
  }

}
