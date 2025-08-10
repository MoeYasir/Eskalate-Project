import 'package:eskalate_project/app/navigation.dart';
import 'package:eskalate_project/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: false,
        child: GetMaterialApp(
          initialRoute: Routes.home,
          getPages: Navigation.routes,
          debugShowCheckedModeBanner: false,
          title: "Flutter Prep Project",
          theme: ThemeData(
              scaffoldBackgroundColor: const Color(0xFFE6F0FA),
              appBarTheme: AppBarTheme(
                backgroundColor: const Color(0xFFE6F0FA),
                titleTextStyle:
                    const TextStyle(color: Colors.black, fontSize: 20),
              )),
        ));
  }
}
