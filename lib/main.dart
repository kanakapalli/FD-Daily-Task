import 'dart:ui';

import 'app/config/routes/app_pages.dart';
import 'app/config/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/shared_components/imagepicker/cropper_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Daily Task',
      theme: AppTheme.basic,
      initialRoute: Routes.login,
      getPages: AppPages.routes,
      // home: const CropperView(),
      scrollBehavior: CustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
