// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../features/auth/data/data_source/api_data_source_imp.dart'
    as _i635;
import '../../../features/auth/data/data_source/auth_data_source.dart' as _i606;
import '../../../features/auth/data/repository_implementation/auth_repository_imp.dart'
    as _i745;
import '../../../features/auth/domain/repository/auth_repository.dart' as _i754;
import '../../../features/auth/domain/use_case/forget_password_usecase.dart'
    as _i222;
import '../../../features/auth/domain/use_case/sign_in_usecase.dart' as _i1014;
import '../../../features/auth/domain/use_case/sign_up_usecase.dart' as _i161;
import '../../../features/auth/presentation/cubit/auth_cubit.dart' as _i1066;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i606.AuthDataSource>(() => _i635.ApiDataSourceImp());
    gh.factory<_i754.AuthRepository>(
      () => _i745.AuthRepositoryImp(authDataSource: gh<_i606.AuthDataSource>()),
    );
    gh.factory<_i222.ForgetPasswordUseCase>(
      () => _i222.ForgetPasswordUseCase(
        authRepository: gh<_i754.AuthRepository>(),
      ),
    );
    gh.factory<_i1014.SignInUseCase>(
      () => _i1014.SignInUseCase(authRepository: gh<_i754.AuthRepository>()),
    );
    gh.factory<_i161.SignUpUseCase>(
      () => _i161.SignUpUseCase(authRepository: gh<_i754.AuthRepository>()),
    );
    gh.singleton<_i1066.AuthCubit>(
      () => _i1066.AuthCubit(
        gh<_i161.SignUpUseCase>(),
        gh<_i1014.SignInUseCase>(),
        gh<_i222.ForgetPasswordUseCase>(),
      ),
    );
    return this;
  }
}


