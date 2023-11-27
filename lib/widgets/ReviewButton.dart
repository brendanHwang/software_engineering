import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//리뷰를 남겨주는 버튼 위젯 (다운로드 우측에 위치)
//리뷰를 남겨준 경우 이 버튼은 invisible

import 'package:get/get.dart';
import 'package:software_engineering/widgets/PayButton.dart';

class ReviewController extends GetxController {
  var selectedReview = RxString('');
  var isReviewNull = RxBool(false);
  void setSelectedReview(String review) {
    selectedReview(review);
  }

  void setIsReviewNull(bool value) {
    isReviewNull(value);
  }
}

class ReviewButton extends StatelessWidget {
  final ReviewController reviewController;
  final String? docPath;
  final int index;

  const ReviewButton({
    Key? key,
    required this.reviewController,
    this.docPath,
    required this.index,
  }) : super(key: key);

  // 리뷰 제출
  void submitReview(String reviewType) async {
    // 리뷰 제출 후 리뷰 상태 업데이트
    // 예: selectedReview.value = 'submitted';

    String reviewText = '';
    int? reviewNum;

    switch (reviewType) {
      case 'like':
        reviewText = '좋아요';
        reviewNum = 1;
        break;
      case 'normal':
        reviewText = '보통이에요';
        reviewNum = 0;
        break;
      case 'dislike':
        reviewText = '싫어요';
        reviewNum = -1;
        break;
      default:
        reviewText = '';
        reviewNum = null;
        break;
    }
    //content 에 review 값 반영
    if (docPath != null) {
      List<String> pathParts = docPath!.split('/');
      String docID = pathParts.length > 1 ? pathParts[1] : '';

      FirebaseFirestore.instance.collection('content').doc(docID).update({
        'review.$reviewText': FieldValue.increment(1),
      });

      //User 에 review 여부 반영
      //'좋아요'는 1, '보통이에요'는 0, '싫어요'는 -1
      DocumentReference<Map<String, dynamic>> docRef = FirebaseFirestore
          .instance
          .collection('user')
          .doc(getCurrentUserUid());

      DocumentSnapshot<Map<String, dynamic>> docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        List<dynamic> purchasedContents =
            docSnapshot.data()?['purchasedContents'];

        Map<String, dynamic> updatedItem =
            Map<String, dynamic>.from(purchasedContents[index]);
        updatedItem['review'] = reviewNum;

        purchasedContents[index] = updatedItem;

        await docRef.update({'purchasedContents': purchasedContents});
      } else {
        print('문서를 찾을 수 없습니다.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isReviewNullValue = reviewController.isReviewNull.value;

      // Firestore 데이터 확인하여 isReviewNull 값 업데이트
      FirebaseFirestore.instance
          .collection('user')
          .doc(getCurrentUserUid())
          .get()
          .then((docSnapshot) {
        if (docSnapshot.exists) {
          List<dynamic> purchasedContents =
              docSnapshot.data()?['purchasedContents'];

          dynamic item = purchasedContents[index];
          //Firestore 에서 review가 null인지 확인
          if (item['review'] == null) {
            reviewController.setIsReviewNull(true);
          }
        } else {
          print('문서를 찾을 수 없습니다.');
        }
      }).catchError((error) {
        print('Firestore 데이터 가져오기 에러: $error');
      });
      return IconButton(
        onPressed: () {
          // 기존에 리뷰가 등록되었다면 동작하지 않도록 처리
          if (reviewController.selectedReview.value.isEmpty &&
              reviewController.isReviewNull.value) {
            Get.defaultDialog(
              // ... 이전과 동일한 다이얼로그 코드 ...
              title: '리뷰 선택',
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: const Text('좋아요'),
                    leading: Obx(() => Icon(
                          reviewController.selectedReview.value == 'like'
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: reviewController.selectedReview.value == 'like'
                              ? Colors.green
                              : Colors.grey,
                        )),
                    onTap: () {
                      reviewController.setSelectedReview('like');
                    },
                  ),
                  ListTile(
                    title: const Text('보통이에요'),
                    leading: Obx(() => Icon(
                          reviewController.selectedReview.value == 'normal'
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color:
                              reviewController.selectedReview.value == 'normal'
                                  ? Colors.green
                                  : Colors.grey,
                        )),
                    onTap: () {
                      reviewController.setSelectedReview('normal');
                    },
                  ),
                  ListTile(
                    title: const Text('싫어요'),
                    leading: Obx(() => Icon(
                          reviewController.selectedReview.value == 'dislike'
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color:
                              reviewController.selectedReview.value == 'dislike'
                                  ? Colors.green
                                  : Colors.grey,
                        )),
                    onTap: () {
                      reviewController.setSelectedReview('dislike');
                    },
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('취소'),
                ),
                TextButton(
                  onPressed: () {
                    if (reviewController.selectedReview.value.isNotEmpty) {
                      submitReview(reviewController.selectedReview.value);
                      // 리뷰 제출 후, 리뷰 버튼 비활성화 처리
                      // purchasedContent.review=1; //임의로
                      reviewController.setSelectedReview('submitted');
                      Get.back();
                    }
                  },
                  child: const Text('등록'),
                ),
              ],
            );
          }
        },
        icon: Icon(
          Icons.reviews_rounded,
          // size: 40,
          // 리뷰가 제출된 콘텐츠의 리뷰 버튼은 회색으로 변경
          color: (reviewController.selectedReview.value == 'submitted' ||
                  !reviewController.isReviewNull.value)
              ? Colors.grey
              : Colors.black,
        ),
      );

  }
}