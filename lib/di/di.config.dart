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

import '../core/Services/api_manager.dart' as _i694;
import '../data/data_source/attendance_remote_data_source.dart' as _i283;
import '../data/data_source/login_remote_data_source.dart' as _i990;
import '../data/data_source/session_remote_data_source.dart' as _i125;
import '../data/data_source/user_remote_data_source.dart' as _i64;
import '../data/repository_impl/attendance_repository_impl.dart' as _i371;
import '../data/repository_impl/login_repository_impl.dart' as _i458;
import '../data/repository_impl/session_repository_impl.dart' as _i54;
import '../data/repository_impl/user_repository_impl.dart' as _i738;
import '../domain/repository/attendance_repository.dart' as _i616;
import '../domain/repository/login_repository.dart' as _i719;
import '../domain/repository/session_repository.dart' as _i757;
import '../domain/repository/user_repository.dart' as _i541;
import '../domain/use_case/attendance_use_cae.dart' as _i986;
import '../domain/use_case/login_use_case.dart' as _i772;
import '../domain/use_case/session_use_case.dart' as _i628;
import '../domain/use_case/user_use_case.dart' as _i1044;
import '../Feature/attendance/manager/attendance_view_model.dart' as _i156;
import '../Feature/login/presentation/manager/login_view_model.dart' as _i638;
import '../Feature/session_screen/manager/session_view_model.dart' as _i706;
import '../Feature/subject_screen/presentation/manager/user_view_model.dart'
    as _i940;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i694.ApiManager>(() => _i694.ApiManager());
    gh.factory<_i283.AttendanceRemoteDataSource>(
      () => _i283.AttendanceRemoteDataSourceImpl(gh<_i694.ApiManager>()),
    );
    gh.factory<_i64.UserRemoteDataSource>(
      () => _i64.UserRemoteDataSourceImpl(gh<_i694.ApiManager>()),
    );
    gh.factory<_i125.SessionRemoteDataSource>(
      () => _i125.SessionRemoteDataSourceImpl(gh<_i694.ApiManager>()),
    );
    gh.factory<_i616.AttendanceRepository>(
      () => _i371.AttendanceRepositoryImpl(
        gh<_i283.AttendanceRemoteDataSource>(),
      ),
    );
    gh.factory<_i990.LoginRemoteDataSource>(
      () => _i990.LoginRemoteDataSourceImpl(gh<_i694.ApiManager>()),
    );
    gh.factory<_i719.LoginRepository>(
      () => _i458.LoginRepositoryImpl(gh<_i990.LoginRemoteDataSource>()),
    );
    gh.factory<_i772.LoginUseCase>(
      () => _i772.LoginUseCase(gh<_i719.LoginRepository>()),
    );
    gh.factory<_i541.UserRepository>(
      () => _i738.UserRepositoryImpl(gh<_i64.UserRemoteDataSource>()),
    );
    gh.factory<_i757.SessionRepository>(
      () => _i54.SessionRepositoryImpl(gh<_i125.SessionRemoteDataSource>()),
    );
    gh.factory<_i986.AttendanceUseCase>(
      () => _i986.AttendanceUseCase(gh<_i616.AttendanceRepository>()),
    );
    gh.factory<_i638.LoginViewModel>(
      () => _i638.LoginViewModel(gh<_i772.LoginUseCase>()),
    );
    gh.factory<_i1044.UserUseCase>(
      () => _i1044.UserUseCase(gh<_i541.UserRepository>()),
    );
    gh.factory<_i628.SessionUseCase>(
      () => _i628.SessionUseCase(gh<_i757.SessionRepository>()),
    );
    gh.factory<_i706.SessionViewModel>(
      () => _i706.SessionViewModel(gh<_i628.SessionUseCase>()),
    );
    gh.factory<_i156.AttendanceViewModel>(
      () => _i156.AttendanceViewModel(gh<_i986.AttendanceUseCase>()),
    );
    gh.factory<_i940.UserViewModel>(
      () => _i940.UserViewModel(gh<_i1044.UserUseCase>()),
    );
    return this;
  }
}
