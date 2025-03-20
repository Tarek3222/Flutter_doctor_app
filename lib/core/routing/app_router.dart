import 'package:doctor/core/di/dependancy_injection.dart';
import 'package:doctor/core/routing/routes.dart';
import 'package:doctor/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor/features/home/views/home_view.dart';
import 'package:doctor/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor/features/login/views/login_view.dart';
import 'package:doctor/features/on_boarding/views/on_boarding_view.dart';
import 'package:doctor/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:doctor/features/sign_up/views/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingView(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: const HomeView(),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginView(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignUpView(),
          ),
        );
      default:
        return null;
    }
  }
}
