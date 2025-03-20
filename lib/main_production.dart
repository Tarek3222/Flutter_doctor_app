import 'package:doctor/core/di/dependancy_injection.dart';
import 'package:doctor/core/helpers/constants.dart';
import 'package:doctor/core/helpers/extensions.dart';
import 'package:doctor/core/helpers/shared_pref_helper.dart';
import 'package:doctor/core/routing/app_router.dart';
import 'package:doctor/doctor_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();

  await Future.wait(
    [
      // to fix text being hidden due to bug in flutter_screenutil package in release mode
      ScreenUtil.ensureScreenSize(),
      checkIfLoggedInUser(),
    ],
  );
  runApp(
    DoctorApp(
      appRouter: AppRouter(),
    ),
  );
}

Future<void> checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

  if (userToken.isNullOrEmpty()) {
    isLoggedIn = false;
  } else {
    isLoggedIn = true;
  }
}
