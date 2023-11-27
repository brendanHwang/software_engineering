import 'package:get/get.dart';
import 'package:software_engineering/models/UserModel.dart';
import 'package:software_engineering/screens/AuthenticationWrapper.dart';
import 'package:software_engineering/utils/firebase_auth.dart';

class UserController extends GetxController {
  Rx<UserModel> user = UserModel(email: '', password: '', name: '',).obs;
  // 로그인을 시도하고, 성공 여부에 따라 다른 처리를 하는 메서드
  void login() async {
    try {
      // firebaseLogin 함수를 사용하여 로그인을 시도합니다.
      bool loginSuccess = await firebaseLogin();
      if (loginSuccess) {
        // 로그인에 성공한 경우, 사용자를 메인 페이지로 이동시킬 수 있습니다.
        Get.off(const AuthenticationWrapper());
      } else {
        // 로그인에 실패한 경우, 에러 메시지를 표시합니다.
        Get.snackbar("로그인 실패", "이메일 또는 비밀번호를 확인해주세요.");
        user.value.reset();
      }
    } catch (e) {
      // 예외가 발생한 경우, 사용자에게 정보를 제공합니다.
      Get.snackbar("오류 발생", "로그인 중 문제가 발생했습니다: $e");
      user.value.reset();
    }
  }
}
