// lib/main.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admindashboard/routes/app_routes.dart';
// ...existing code...
import 'package:admindashboard/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CropsureConnect Dashboard',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.greenTheme,
      initialRoute: AppRoutes.dashboard,
      getPages: AppRoutes.pages,
    );
  }
}