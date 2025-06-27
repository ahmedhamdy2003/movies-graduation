
import 'package:my_movie_app/core/common/error_handling.dart';

import '../../domain/entity/user_entity.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState {}
final class AuthSuccess extends AuthState {
  UserEntity userEntity;
  AuthSuccess({required this.userEntity});
}
final class AuthFailure extends AuthState {
  Failure failure;
  AuthFailure({required this.failure});
}
