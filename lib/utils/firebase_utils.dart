import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
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
    await firestore
        .collection('user')
        .doc(userCredential.user!.uid)
        .set(
          signupController.user.value.toSignupDocument(),
        );
    Get.snackbar('회원가입 성공', '회원가입에 성공했습니다.');
    success = true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      Get.snackbar(signupCheckSnackTitle, "비밀번호가 너무 약합니다.");
    } else if (e.code == 'email-already-in-use') {
      Get.snackbar(signupCheckSnackTitle, "이미 존재하는 계정입니다.");
    } else {
      Get.snackbar(signupCheckSnackTitle, e.toString());
    }
  } catch (e) {
    // 기타 예외 처리
    Get.snackbar(signupCheckSnackTitle, "회원가입에 실패했습니다.");
    // print(e);
  }
  return success;
}

Future<bool> firebaseLogin() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  LoginController loginController = Get.find();
  try {
    // Firebase를 사용하여 이메일과 비밀번호로 사용자 로그인
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: loginController.user.value.email,
        password: loginController.user.value.password);
    // 사용자 로그인 성공
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      Get.snackbar("로그인 실패", "등록되지 않은 사용자입니다.");
    } else if (e.code == 'wrong-password') {
      Get.snackbar("로그인 실패", "잘못된 비밀번호입니다.");
    } else {
      Get.snackbar("로그인 실패", e.message!); // 에러 메시지 출력
    }
    return false;
  } catch (e) {
    // 기타 예외 처리
    // print(e);
    return false;
  }
}

Future<void> firebaseLogout() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  await _auth.signOut();
}

