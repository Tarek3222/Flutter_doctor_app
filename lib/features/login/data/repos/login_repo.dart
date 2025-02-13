import 'package:dartz/dartz.dart';
import 'package:doctor/core/networking/api_error_handler.dart';
import 'package:doctor/core/networking/api_service.dart';
import 'package:doctor/features/login/data/models/login_request_body.dart';
import 'package:doctor/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<Either<ErrorHandler, LoginResponse>> login(
      {required LoginRequestBody loginRequestBody}) async {
    try {
      LoginResponse response = await _apiService.login(loginRequestBody);
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
