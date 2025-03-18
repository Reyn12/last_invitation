import 'package:flutter/material.dart';
import 'routes.dart';
import 'utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Last Invitation',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.accent,
        ),
        scaffoldBackgroundColor: AppColors.background,
      ),
      initialRoute: '/',
      routes: appRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
