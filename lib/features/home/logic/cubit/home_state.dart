//home_state.dart
import 'package:doctor/features/home/data/models/specialization_response_model.dart';

sealed class HomeState {
  const HomeState();
}

class InitialState extends HomeState {
  const InitialState();
}

class LoadingState extends HomeState {
  const LoadingState();
}

class ErrorState extends HomeState {
  final String errorMessage;
  const ErrorState({required this.errorMessage});
}

class SuccessState extends HomeState {
  final SpecializationResponseModel specializationResponseModel;
  const SuccessState({required this.specializationResponseModel});
}
