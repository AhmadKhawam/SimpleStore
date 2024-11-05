import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:task6/bindings/intialbindings.dart';

import 'package:task6/routes.dart';
import 'core/const_data/routes.dart';
import 'core/service/my_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MyService();
  await MyService.initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: 'Raleway',
            ),
            // theme: Themes.lightTheme,
            initialBinding: InitialBindings(),
            getPages: routes,
            initialRoute: Routes.onboarding,
          );
        });
  }
}
