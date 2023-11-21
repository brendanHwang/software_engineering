import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PayButton extends StatelessWidget {
  const PayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: IconButton(
          onPressed: () {
            decreasePoint(getCurrentUserUid());
          },
          icon: const Icon(Icons.payment_outlined),
          iconSize: 40,
          color: Colors.black,
        ));
  }
}

Future<void> decreasePoint(String userId) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DocumentReference ref = firestore.collection('user').doc(userId);
  return firestore.runTransaction((Transaction tx) async {
    DocumentSnapshot postSnapshot = await tx.get(ref);
    if (postSnapshot.exists) {
      var data = postSnapshot.data() as Map<String, dynamic>; // Here
      if (data['point'] != null) {
        int newPoint = data['point'] - 3;
        tx.update(ref, <String, dynamic>{'point': newPoint});
      }
    }
  });
}

String getCurrentUserUid() {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    String uid = user.uid;
    print('현재 사용자의 Firebase UID: $uid');
    return uid;
  } else {
    print('현재 로그인한 사용자가 없습니다.');
    return "";
  }
}
