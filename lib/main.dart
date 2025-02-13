import 'package:doctor/core/di/dependancy_injection.dart';
import 'package:doctor/core/routing/app_router.dart';
import 'package:doctor/doctor_app.dart';
import 'package:flutter/material.dart';

void main() {
  setupGetIt();
  runApp(
    DoctorApp(
      appRouter: AppRouter(),
    ),
  );
}
