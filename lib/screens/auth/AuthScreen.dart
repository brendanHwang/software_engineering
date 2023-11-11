import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/constants/AppPadding.dart';

class AuthScreen extends StatefulWidget {
  final Widget child;


  AuthScreen({Key? key, required this.child}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.only(
            top: AppPadding.topPadding,
            left: AppPadding.horizontalPadding,
            right: AppPadding.horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo2.png',
              fit: BoxFit.contain,
              height: Get.height * 0.1,
            ),
            SingleChildScrollView(
              child: widget.child,
            )
          ],
        ),
      ),
    );
  }
}
