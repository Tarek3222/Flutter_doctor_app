import 'package:doctor/core/di/dependancy_injection.dart';
import 'package:doctor/core/routing/app_router.dart';
import 'package:doctor/doctor_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setupGetIt();
  // to fix text being hidden due to bug in flutter_screenutil package in release mode
  await ScreenUtil.ensureScreenSize();
  runApp(
    DoctorApp(
      appRouter: AppRouter(),
    ),
  );
}
