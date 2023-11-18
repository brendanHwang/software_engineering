import 'dart:html';

import 'package:get/get.dart';
import 'package:software_engineering/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:software_engineering/utils/firebase_auth.dart';

final firebaseAuth = FirebaseAuth.instance;

class PwChangeController extends GetxController {
  Rx<UserModel> user = UserModel(name: '', email: '', password: '').obs;

  // 회원가입 로직. 현재는 데모 상태입니다.
  // 필요에 따라서 실제 로직으로 대체해야 합니다.

  @override
  Future<String> resetPassword(String email) async {
    try {
      String message = await firebasePwChange(email);
      return message;
    } catch (e) {
      return '오류 발생", "문제가 발생했습니다: $e';
    }
  }
}
