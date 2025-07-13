import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/error_handling.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImp implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImp({required AuthDataSource authDataSource})
    : _authDataSource = authDataSource;

  @override
  Future<Either<Failure, String>> forgetPassword(String email) async {
    try {
      final result = await _authDataSource.resetPassword(email: email);
      return right(result);
    } catch (e) {
      return left(Failure.handleError(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authDataSource.login(
        email: email,
        password: password,
      );
      final user = UserEntity(
        name: response.data?.name ?? '',
        email: response.data?.email ?? '',
        phone: response.data?.phone ?? '',
        password: password,
        avatarId: response.data?.avatarId ?? 1,
      );
      return right(user);
    } catch (e) {
      return left(Failure.handleError(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
    required int avatarId,
  }) async {
    try {
      final response = await _authDataSource.register(
        name: name,
        email: email,
        password: password,
        avatarId: avatarId,
        phone: phoneNumber,
        confirmPassword: confirmPassword,
      );
      final user = UserEntity(
        name: response.data?.name ?? '',
        email: response.data?.email ?? '',
        phone: response.data?.phone ?? '',
        password: password,
        avatarId: response.data?.avatarId ?? 1,
      );
      return right(user);
    } catch (e) {
      return left(Failure.handleError(e));
    }
  }
}
