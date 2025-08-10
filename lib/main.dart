import 'package:eskalate_project/app/navigation.dart';
import 'package:eskalate_project/app/routes.dart';
import 'package:eskalate_project/controllers/theme_controller.dart'; // Add this
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:eskalate_project/app/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the ThemeController before runApp
  Get.put(ThemeController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    // Define your light and dark themes here or import from a theme.dart

    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return Obx(() => GetMaterialApp(
              initialRoute: Routes.home,
              getPages: Navigation.routes,
              debugShowCheckedModeBanner: false,
              title: "Eskalate Project",
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: themeController.themeMode,
            ));
      },
    );
  }
}
