import 'package:get/get.dart';
import 'package:software_engineering/models/UserModel.dart';
import 'package:software_engineering/screens/auth/PwChangeScreen.dart';



class PwChangeController extends GetxController {
  Rx<UserModel> user = UserModel(name: '', email: '', password: '').obs;

  // 회원가입 로직. 현재는 데모 상태입니다.
  // 필요에 따라서 실제 로직으로 대체해야 합니다.


  // 비동기 회원가입 메서드
  Future<void> pwChange() async {
    // 먼저, 입력된 값들이 유효한지 확인합니다.
  }
  Future<void> sendUrl() async {

    if (user.value.email.isNotEmpty) {
      // TODO : 이메일로 비밀번호 변경 url 보내기
      Get.to(() => PwChangeScreen());
    }else{
      Get.snackbar("전송 불가", "이메일을 입력해주세요");
    }
  }
}
