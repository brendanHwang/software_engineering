import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:software_engineering/screens/welcom.dart';

class LoginController extends GetxController {
  static LoginController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth authentication = FirebaseAuth.instance;

  var logger = Logger(
    printer: PrettyPrinter(),
  );

  void login(String email, password) async {
    // TODO: 로그인 로직 추가
    try {
      await authentication.signInWithEmailAndPassword(
          email: email, password: password);
      Get.to(() => const WelcomePage());
    } on FirebaseAuthException catch (e) {
      logger.e(e);
      String message = '';
      if (e.code == 'invalid-login-credentials') {
        print("fdg");
        message = '비밀번호 혹은 아이디를 확인해 주세요.';
      }  else if (e.code == 'invalid-email') {
        message = '이메일을 확인하세요.';
      }
      // else if (e.code == 'wrong-password') {
      //   print("adfasf"); 
      //   message = '비밀번호를 확인하세요';
      // }
      Get.snackbar(
        '오류',
        message,
        backgroundColor: Colors.deepOrange,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
