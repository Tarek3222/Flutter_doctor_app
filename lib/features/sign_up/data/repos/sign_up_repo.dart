import 'package:dartz/dartz.dart';
import 'package:doctor/core/networking/api_error_handler.dart';
import 'package:doctor/core/networking/api_service.dart';
import 'package:doctor/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:doctor/features/sign_up/data/models/sign_up_response.dart';

class SignUpRepo {
  final ApiService _apiService;

  SignUpRepo(this._apiService);

  Future<Either<ErrorHandler, SignUpResponse>> signup(
      {required SignUpRequestBody signUpRequestBody}) async {
    try {
      SignUpResponse response = await _apiService.signUp(signUpRequestBody);
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
