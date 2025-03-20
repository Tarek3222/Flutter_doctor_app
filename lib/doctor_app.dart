import 'package:doctor/core/helpers/constants.dart';
import 'package:doctor/core/routing/app_router.dart';
import 'package:doctor/core/routing/routes.dart';
import 'package:doctor/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorApp extends StatelessWidget {
  const DoctorApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: isLoggedIn ? Routes.homeScreen : Routes.loginScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
