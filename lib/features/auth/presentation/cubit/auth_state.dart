// abstract class AuthState {}
// class AuthInitial extends AuthState {}
// class AuthLoading extends AuthState {}
// class AuthSuccess extends AuthState {}
// class AuthFailure extends AuthState {
//   final Failure failure;
//   AuthFailure(this.failure);
// }

// auth_state.dart
import '../../../../core/common/error_handling.dart';
import '../../domain/entity/user_entity.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserEntity user;

  AuthSuccess(this.user);
}

class AuthFailure extends AuthState {
  final Failure failure;

  AuthFailure(this.failure);
}

class AuthForgotPasswordSuccess extends AuthState {
  final String message;

  AuthForgotPasswordSuccess(this.message);
}
