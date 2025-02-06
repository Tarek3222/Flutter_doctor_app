import 'package:doctor/core/routing/app_router.dart';
import 'package:doctor/doctor_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DoctorApp(
      appRouter: AppRouter(),
    ),
  );
}
