import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:software_engineering/controllers/UploadController.dart';
import 'package:software_engineering/screens/MainPage.dart';

import 'firebase_storage_util.dart';

/// firebase firestore content collection에 새로운 문서를 생성하여 content를 등록하는 함수 입니다.
/// uplaodFile() 함수를 통해 firebase storage에 파일을 업로드하고
/// 현재 firebase auth에 로그인된 사용자의 uid를 content의 userID에 저장합니다.
/// content.uploadDateTime에 현재 시간을 저장합니다.
/// content를 json으로 변환하여 firestore에 저장합니다.
Future<void> uploadContent() async {
  final uploadController = Get.find<UploadController>();
  final user = FirebaseAuth.instance.currentUser;


  if (user != null && uploadController.selectedFile.value != null) {
    // 현재 로그인된 사용자의 UID
    String userId = user.uid;

    await uploadFile(); //firebase storage에 우선 파일을 업로드하고

    // Firestore에 저장하기 직전에 채워야할 필드들을 채웁니다.
    uploadController.content.uploadDateTime = DateTime.now();
    uploadController.content.userID = userId;

    try {
      // firestore에 content를 저장합니다.
      await FirebaseFirestore.instance.collection('content').add(uploadController.content.toJson());
      // firestore에 저장 이후
      //TODO 포인트 증가
      // await FirebaseFirestore.instance.collection('users').doc(userId).update({
      //   'point' : FieldValue.increment(6) // 업로드 시 포인트 6점 증가
      // });
      uploadController.reset();

      // print('Content uploaded successfully');
      Get.to(() => MainPage());
      Get.snackbar('업로드 성공', '성공적으로 업로드 되었습니다');

    } catch (e) {
      print('Error uploading content $e');
    }
  }
}


