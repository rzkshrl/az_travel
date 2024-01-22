import 'package:az_travel/app/theme/theme.dart';
import 'package:az_travel/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const AZTravelApp());
}

class AZTravelApp extends StatelessWidget {
  const AZTravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: "AZ Travel",
        debugShowCheckedModeBanner: false,
        theme: AZTravelTheme.lightTheme,
        initialRoute: Routes.LOGIN,
        getPages: AppPages.routes,
      );
    });
  }
}
