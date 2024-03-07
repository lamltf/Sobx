import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sobx/constants/local_manager.dart';
import 'package:sobx/constants/theme_manager.dart';
import 'package:sobx/routes/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = LocalManager.instance.read(key: 'isDarkMode') ?? false;
    return ScreenUtilInit(
      builder: (context, child) {
        return GetCupertinoApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.getCurrentState(),
          getPages: AppPages.routes,
          localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          theme: isDarkMode
              ? ThemeManager.instance.getDarkTheme()
              : ThemeManager.instance.getLightTheme(),
        );
      },
    );
  }
}
