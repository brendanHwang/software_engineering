import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/constants/AppColor.dart';
import 'package:software_engineering/controllers/AppSearchController.dart';
import 'package:software_engineering/controllers/LoginController.dart';

import 'package:software_engineering/screens/AuthenticationWrapper.dart';
import 'package:software_engineering/screens/ContentsInfoScreen.dart';
// import 'package:software_engineering/controllers/LoginController.dart';
// import 'package:software_engineering/controllers/SignupController.dart';
import 'package:software_engineering/screens/auth/LoginScreen.dart';
import 'package:software_engineering/screens/SearchScreen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AppSearchController());
    Get.lazyPut(() => UserController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'software engineering',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(AppColor.mainColor)),
        useMaterial3: true,
      ),
      home: SearchScreen(),
    );
  }
}
