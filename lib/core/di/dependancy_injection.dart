import 'package:dio/dio.dart';
import 'package:doctor/core/networking/api_service.dart';
import 'package:doctor/core/networking/dio_factory.dart';
import 'package:doctor/features/login/data/repos/login_repo.dart';
import 'package:doctor/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:doctor/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(dio),
  );
  // Login
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(getIt<ApiService>()),
  );
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(getIt<LoginRepo>()),
  );
  //signup
  getIt.registerLazySingleton<SignUpRepo>(
    () => SignUpRepo(getIt<ApiService>()),
  );
  getIt.registerFactory<SignupCubit>(
    () => SignupCubit(getIt<SignUpRepo>()),
  );
}
