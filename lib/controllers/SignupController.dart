import 'package:get/get.dart';

class SignupController extends GetxController {
  // 아이디, 비밀번호, 이름 등의 상태를 관리
  var name = ''.obs;
  var userID = ''.obs;
  var password = ''.obs;
  var passwordApprove = ''.obs;

  // 회원가입 로직. 현재는 데모 상태입니다.
  // 필요에 따라서 실제 로직으로 대체해야 합니다.
  void signup() {
    // 비밀번호 확인
    if(password.value != passwordApprove.value) {
      Get.snackbar("에러", "비밀번호가 일치하지 않습니다.");
      return;
    }

    // TODO: 실제 회원가입 로직을 여기에 추가하세요.
    // 예: API 호출을 통한 회원가입 처리

    Get.snackbar("성공", "회원가입 요청이 전송되었습니다.");
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
