import 'package:get/get.dart';
import 'package:software_engineering/models/UserModel.dart';
import 'package:software_engineering/utils/firebase_utils.dart';

const String signupCheckSnackTitle = "가입 정보 오류";


class SignupController extends GetxController {
  Rx<UserModel> user = UserModel(name: '', email: '', password: '').obs;

  // 회원가입 로직. 현재는 데모 상태입니다.
  // 필요에 따라서 실제 로직으로 대체해야 합니다.
  bool validInput() {

    // 비어 있는 값 확인
    if(user.value.name == '' || user.value.email == '' || user.value.password == '' || user.value.passwordApprove == '') {
      Get.snackbar(signupCheckSnackTitle, "빈 값이 있습니다.");
      return false;
    }

    // 이메일 형식 확인
    if(!GetUtils.isEmail(user.value.email)) {
      Get.snackbar(signupCheckSnackTitle, "이메일 형식이 아닙니다.");
      return false;
    }


    // 비밀번호 길이 확인
    if(user.value.password.length < 8) {
      Get.snackbar(signupCheckSnackTitle, "비밀번호는 8자리 이상이어야 합니다.");
      return false;
    }

    // 비밀번호 확인
    if(user.value.password != user.value.passwordApprove) {
      Get.snackbar(signupCheckSnackTitle, "비밀번호가 일치하지 않습니다.");
      return false;
    }

    return true;
  }

  // 비동기 회원가입 메서드
  Future<void> signup() async {
    // 먼저, 입력된 값들이 유효한지 확인합니다.
    if (!validInput()) {
      // 입력값에 문제가 있다면, validInput() 내부에서 이미 사용자에게 알림이 되었을 것이므로,
      // 여기서는 추가 조치를 취하지 않고 종료합니다.
      return;
    }
    // 여기까지 왔다면, 입력값이 유효하다는 의미이므로 Firebase를 통한 회원가입을 진행합니다.
    await firebaseSignup();
    // 만약 여기에 도달했다면, firebaseSignup()에서 어떤 문제가 발생했음을 의미합니다.
    // 해당 함수 내에서 적절한 사용자 피드백이 이미 있었을 것이므로, 여기서 추가적인 조치는 필요하지 않습니다.
  }


}
