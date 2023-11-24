import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/controllers/AppSearchController.dart';
import 'package:software_engineering/controllers/PurchasedController.dart';
import 'package:software_engineering/controllers/UploadController.dart';
import 'package:software_engineering/models/Content.dart';
import 'package:software_engineering/models/PurchasedContent.dart';
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

  if (user == null || uploadController.selectedFile.value == null) {
    print('No user logged in or no file selected');
    return;
  }

  String userId = user.uid;

  try {
    await uploadFile(); // Firebase Storage에 파일을 업로드
    uploadController.content.uploadDateTime = DateTime.now();
    uploadController.content.userID = userId;

    FirebaseFirestore.instance.runTransaction((Transaction tx) async {
      DocumentReference contentRef = FirebaseFirestore.instance.collection('content').doc();
      uploadController.content.docPath = contentRef.path;

      DocumentReference userRef = FirebaseFirestore.instance.collection('user').doc(userId);

      // 콘텐츠 저장 및 포인트 증가
      tx.set(contentRef, uploadController.content.toJson());
      tx.update(userRef, {'point': FieldValue.increment(6)});

      Get.to(() => MainPage());
      Get.snackbar('업로드 성공', '성공적으로 업로드 되었습니다');
    });
  } catch (e) {
    print('Error uploading content $e');
  }
}


/// firebase firestore content collection에서 content collection에서 title field가 keyword를 포함하는 문서들을 검색하여 반환하는 함수입니다.
Future<void> searchContent(String keyword) async {
  final searchController = Get.find<AppSearchController>();

  try {
    var contents = await FirebaseFirestore.instance
        .collection('content')
        .where('title', isGreaterThanOrEqualTo: keyword)
        .where('title', isLessThan: keyword + '\uf8ff')
        .get();

    // 검색된 content들을 Content 객체로 변환합니다.
    searchController.searchedContents.value = contents.docs
        .map((e) {
      var data = e.data();
      // review 필드가 Map<String, int>이 기대되는 경우, 적절한 타입으로 변환합니다.
      // if (data['review'] != null) {
      //   data['review'] = Map<String, int>.from(data['review'].map((key, value) {
      //     return MapEntry(key, value is int ? value : int.tryParse(value.toString()) ?? 0);
      //   }));
      // }
      return Content.fromJson(data);
    }).toList();

  } catch (e) {
    print('Error searching content $e');
  }
}

/// firebase firestore user collection에서 purchasedContents field(List<Map<String, dynamic>>)에 docPath에 해당하는 것을 firebase firestore content collection에서 찾아 반환하는 함수입니다.
Future<void> getPurchasedContents() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  final purchasedController = Get.find<PurchasedController>();

  if (user == null) {
    Get.snackbar('오류', '로그인된 사용자가 없습니다.');
    return;
  }

  String userId = user.uid;

  try {
    // 사용자의 구매 내역 조회
    DocumentSnapshot userDoc = await firestore.collection('user').doc(userId).get();
    if (!userDoc.exists || userDoc.data() == null) {
      Get.snackbar('오류', '사용자 정보를 찾을 수 없습니다.');
      return;
    }

    var userPurchasedContents = (userDoc.data() as Map<String, dynamic>)['purchasedContents'];

    purchasedController.purchasedContents = RxList<PurchasedContent>();
    if (userPurchasedContents != null) {
      for (var purchase in userPurchasedContents) {
        String docPath = purchase['docPath'];
        DocumentSnapshot<Map<String, dynamic>> contentDoc = await getContentFromDocPath(docPath);
        print(contentDoc.data());
        if (contentDoc.exists) {
          Content content = Content.fromJson(contentDoc.data()!); // Content 객체 생성

          purchasedController.purchasedContents.add(PurchasedContent(content: content, purchasedDateTime: (purchase['purchasedDateTime'] as Timestamp).toDate(), review: purchase['review'])); // 구매 내역에 추가
        }
      }
    }
  } catch (e) {
    print('Error getting purchased contents $e');
  }
}

Future<DocumentSnapshot<Map<String, dynamic>>> getContentFromDocPath(String docPath) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // docPath에서 컬렉션 이름과 문서 ID를 분리
  var pathSegments = docPath.split('/');
  if (pathSegments.length != 2 || pathSegments[0] != 'content') {
    throw Exception('잘못된 문서 경로입니다: $docPath');
  }
  String docId = pathSegments[1];

  // Firestore에서 해당 문서 조회
  DocumentReference<Map<String, dynamic>> docRef = firestore.collection('content').doc(docId);
  return await docRef.get();
}

