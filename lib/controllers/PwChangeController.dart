import 'package:get/get.dart';
import 'package:software_engineering/models/UserModel.dart';
import 'package:software_engineering/screens/AuthenticationWrapper.dart';
import 'package:software_engineering/utils/firebase_auth.dart';
import 'package:software_engineering/screens/auth/PasswordChangeScressn(pw).dart';



class PwChangeController extends GetxController {
  Rx<UserModel> user = UserModel(name: '', email: '', password: '').obs;

  // 회원가입 로직. 현재는 데모 상태입니다.
  // 필요에 따라서 실제 로직으로 대체해야 합니다.


  // 비동기 회원가입 메서드
  Future<void> pwChange() async {
    // 먼저, 입력된 값들이 유효한지 확인합니다.
  }
  Future<void> sendUrl() async {
    // 먼저, 입력된 값들이 유효한지 확인합니다.
    if (user.value.validInput())
      Get.to(() => PwchangeScreenPw());
  }
}
