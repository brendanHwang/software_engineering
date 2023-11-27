import 'package:get/get.dart';
import 'package:software_engineering/constants/AppString.dart';

class UserModel {
  String name;
  String email;
  String password;
  String? passwordApprove;
  int point ;
  List<Map<String,dynamic>>? purchasedContents;


  UserModel({
    required this.name,
    required this.email,
    this.password = '',
    this.purchasedContents,
    this.point = 0,
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
    if(password.length < 10) {
      Get.snackbar(AppString.signupCheckSnackTitle, "비밀번호는 10자리 이상이어야 합니다.");
      return false;
    }

    // 비밀번호 확인
    if(password == passwordApprove) {
      Get.snackbar(AppString.signupCheckSnackTitle, "비밀번호가 일치하지 않습니다.");
      return false;
    }

    return true;
  }

  // Firebase Document로부터 UserModel 생성 (purchase 할 때 사용)
  factory UserModel.fromDocument(Map<String, dynamic> doc) {
    // 'purchasedContents' 필드의 데이터를 안전하게 변환합니다.
    List<Map<String, dynamic>>? safePurchasedContents = (doc['purchasedContents'] as List<dynamic>?)
        ?.map((item) => Map<String, dynamic>.from(item as Map))
        .toList();

    return UserModel(
      name: doc['name'],
      email: doc['email'],
      purchasedContents: safePurchasedContents ?? <Map<String, dynamic>>[],
      point: doc['point'],

    );
  }

  // UserModel을 Map으로 변환 (회원가입)
  Map<String, dynamic> toSignupDocument() {
    return {
      'name': name,
      'email': email,
      'point' : point,
    };
  }

  @override
  String toString() {
    return 'UserModel{name: $name, email: $email, password: $password, passwordApprove: $passwordApprove, purchasedContents: $purchasedContents}';
  }


  void reset() {
    name = '';
    email = '';
    password = '';
    passwordApprove = '';
    purchasedContents = <Map<String, dynamic>>[];
    point = 0;
  }
}
