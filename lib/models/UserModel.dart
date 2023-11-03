import 'package:get/get.dart';
import 'package:software_engineering/constants/AppString.dart';

class UserModel {
  String name;
  String email;
  String password;
  String? passwordApprove;


  UserModel({
    required this.name,
    required this.email,
    required this.password,
  });

  bool validInput() {
    // 비어 있는 값 확인
    if(name == '' || email == '' || password == '' || passwordApprove == '') {
      Get.snackbar(AppString.signupCheckSnackTitle, "빈 값이 있습니다.");
      return false;
    }

    // 이메일 형식 확인
    if(!GetUtils.isEmail(email)) {
      Get.snackbar(AppString.signupCheckSnackTitle, "이메일 형식이 아닙니다.");
      return false;
    }

    // 비밀번호 길이 확인
    if(password.length < 8) {
      Get.snackbar(AppString.signupCheckSnackTitle, "비밀번호는 8자리 이상이어야 합니다.");
      return false;
    }

    // 비밀번호 확인
    if(password == passwordApprove) {
      Get.snackbar(AppString.signupCheckSnackTitle, "비밀번호가 일치하지 않습니다.");
      return false;
    }

    return true;
  }

  // Firebase Document로부터 UserModel 생성
  factory UserModel.fromDocument(Map<String, dynamic> doc) {
    return UserModel(
      name: doc['name'],
      email: doc['email'], // 이메일로 사용될 수 있습니다.
      password: doc['password'],
    );
  }

  // UserModel을 Map으로 변환
  Map<String, dynamic> toSignupDocument() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
