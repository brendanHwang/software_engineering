import 'package:get/get.dart';
import 'package:software_engineering/models/UserModel.dart';
import 'package:software_engineering/screens/AuthenticationWrapper.dart';
import 'package:software_engineering/utils/firebase_auth.dart';


class SignupController extends GetxController {
  Rx<UserModel> user = UserModel(name: '', email: '', password: '').obs;

  // 회원가입 로직. 현재는 데모 상태입니다.
  // 필요에 따라서 실제 로직으로 대체해야 합니다.


  // 비동기 회원가입 메서드
  Future<void> signup() async {
    // 먼저, 입력된 값들이 유효한지 확인합니다.
    if (!user.value.validInput()) {
      // 입력값에 문제가 있다면, validInput() 내부에서 이미 사용자에게 알림이 되었을 것이므로,
      // 여기서는 추가 조치를 취하지 않고 종료합니다.
      return;
    }
    // 여기까지 왔다면, 입력값이 유효하다는 의미이므로 Firebase를 통한 회원가입을 진행합니다.
    bool loginSuccess = await firebaseSignup();
    if (loginSuccess) {
      // 회원가입에 성공한 경우, 사용자를 메인 페이지로 이동시킬 수 있습니다.
      Get.off(const AuthenticationWrapper());
    }
    // 만약 여기에 도달했다면, firebaseSignup()에서 어떤 문제가 발생했음을 의미합니다.
    // 해당 함수 내에서 적절한 사용자 피드백이 이미 있었을 것이므로, 여기서 추가적인 조치는 필요하지 않습니다.
  }
}
