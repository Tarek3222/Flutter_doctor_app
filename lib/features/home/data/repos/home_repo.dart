import 'package:dartz/dartz.dart';
import 'package:doctor/core/networking/api_error_handler.dart';
import 'package:doctor/features/home/data/apis/home_api_service.dart';
import 'package:doctor/features/home/data/models/specialization_response_model.dart';

class HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepo(this._homeApiService);

  Future<Either<ErrorHandler, SpecializationResponseModel>>
      getSpecialities() async {
    try {
      SpecializationResponseModel response =
          await _homeApiService.getSpecialities();
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
