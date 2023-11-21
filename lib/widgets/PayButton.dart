import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:software_engineering/models/UserModel.dart';

class PayButton extends StatelessWidget {
  const PayButton({Key? key, this.docPath}) : super(key: key);

  final docPath;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: IconButton(
          onPressed: () async {

           await purchaseContent(docPath);
          },
          icon: const Icon(Icons.payment_outlined),
          iconSize: 40,
          color: Colors.black,
        ));
  }
}
Future<void> purchaseContent(String docPath) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    print('No user logged in');
    return;
  }

  String userId = user.uid;

  return firestore.runTransaction((Transaction tx) async {
    DocumentReference userRef = firestore.collection('user').doc(userId);
    DocumentSnapshot userSnapshot = await tx.get(userRef);

    if (!userSnapshot.exists || userSnapshot.data() == null) {
      // 사용자 문서가 없는 경우
      Get.snackbar('오류', '사용자 정보를 찾을 수 없습니다');
      return;
    }

    UserModel userModel = UserModel.fromDocument(userSnapshot.data() as Map<String, dynamic>);

    // 이미 구매한 항목인지 확인
    bool alreadyPurchased = userModel.purchasedContents!.any((purchase) => purchase['docPath'] == docPath);

    if (alreadyPurchased) {
      Get.snackbar('이미 구매한 컨텐츠입니다', '마이페이지에서 확인해주세요');
      return;
    }

    // 포인트 검사
    int currentPoints = userModel.point;
    if (currentPoints < 3) {
      Get.snackbar('포인트 부족', '포인트가 부족합니다');
      return;
    }

    // 새로운 구매 항목
    Map<String, dynamic> newPurchase = {'docPath': docPath, 'review': null, 'purchasedDateTime': Timestamp.now()};

    // 구매 항목 추가 및 포인트 감소
    tx.update(userRef, {
      'purchasedContents': FieldValue.arrayUnion([newPurchase]),
      'point': FieldValue.increment(-3),
    });
    Get.snackbar('구매 완료', '마이페이지에서 다운로드가 가능합니다');
  }).catchError((e) {
    print('Transaction failed: $e');
  });
}


String getCurrentUserUid() {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    String uid = user.uid;
    // print('현재 사용자의 Firebase UID: $uid');
    return uid;
  } else {
    // print('현재 로그인한 사용자가 없습니다.');
    return "";
  }
}
