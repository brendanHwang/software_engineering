import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:software_engineering/constants/AppString.dart';
import 'package:software_engineering/controllers/LoginController.dart';
import 'package:software_engineering/controllers/SignupController.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> firebaseSignup() async {
  bool success = false;
  SignupController signupController = Get.find();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    // Firebase를 사용하여 이메일과 비밀번호로 사용자 생성
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: signupController.user.value.email,
      password: signupController.user.value.password,
    );

    // 사용자 정보 데이터베이스에 저장
    await firestore.collection('user').doc(userCredential.user!.uid).set(
          signupController.user.value.toSignupDocument(),
        );
    Get.snackbar('회원가입 성공', '회원가입에 성공했습니다.');
    success = true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      Get.snackbar(AppString.signupCheckSnackTitle, "비밀번호가 너무 약합니다.");
    } else if (e.code == 'email-already-in-use') {
      Get.snackbar(AppString.signupCheckSnackTitle, "이미 존재하는 계정입니다.");
    } else {
      Get.snackbar(AppString.signupCheckSnackTitle, e.toString());
    }
  } catch (e) {
    // 기타 예외 처리
    Get.snackbar(AppString.signupCheckSnackTitle, "회원가입에 실패했습니다.");
  }
  return success;
}

Future<bool> firebaseLogin() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserController loginController = Get.find();
  try {
    // Firebase를 사용하여 이메일과 비밀번호로 사용자 로그인
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: loginController.user.value.email,
        password: loginController.user.value.password);
    // 사용자 로그인 성공
    return true;
  } on FirebaseAuthException catch (e) {
    return false;
  } catch (e) {
    // 기타 예외 처리
    return false;
  }
}

Future<void> firebaseLogout() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  await _auth.signOut();
}

Future<String> firebasePwChange(String email) async {
  final firebaseAuth = FirebaseAuth.instance;

  try {
    await firebaseAuth.sendPasswordResetEmail(email: email);
    // 여기에 비밀번호 재설정 이메일이 성공적으로 전송되었을 때의 코드를 추가할 수 있습니다.
    return '비밀번호 재설정 이메일이 전송되었습니다.';
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return '등록된 이메일이 아닙니다.';
    } else if (e.code == 'invalid-email') {
      return '이메일을 입력해 주세요';
    } else {
      return '알 수 없는 에러가 발생했습니다. 에러 코드: ${e.code}';
    }
  } catch (e) {
    return '예상치 못한 에러가 발생했습니다: $e';
  }
}
