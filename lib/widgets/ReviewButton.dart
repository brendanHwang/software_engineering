import 'package:flutter/material.dart';
//리뷰를 남겨주는 버튼 위젯 (다운로드 우측에 위치)
//리뷰를 남겨준 경우 이 버튼은 invisible

import 'package:get/get.dart';
import 'package:software_engineering/controllers/PurchasedController.dart';
import 'package:software_engineering/controllers/PwChangeController.dart';
import 'package:software_engineering/models/PurchasedContent.dart';

class ReviewController extends GetxController {
  var selectedReview = RxString('');

  void setSelectedReview(String review) {
    selectedReview(review);
  }
}

class ReviewButton extends StatefulWidget {
  final PurchasedContent purchasedContent;
  final int index;

  ReviewButton({Key? key, required this.purchasedContent,required this.index}) : super(key: key);

  @override
  State<ReviewButton> createState() => _ReviewButtonState();
}

class _ReviewButtonState extends State<ReviewButton> {
  final ReviewController reviewController = Get.put(ReviewController());

  final purchasedController = Get.find<PurchasedController>();

  String selectedReview = '';

  bool isReviewSubmitted = false;

  int reviewIndex = 1;

  void submitReview() {
    // 리뷰 제출
    // 리뷰 제출 후, 리뷰 버튼 비활성화 처리
    if(reviewController.selectedReview.value == 'like') {
      purchasedController.updateReview(widget.index, 1);
      purchasedController.purchasedContents[widget.index].content.review["좋아요"] = purchasedController.purchasedContents[widget.index].content.review["좋아요"]! + 1;
    } else if(reviewController.selectedReview.value == 'normal') {
      purchasedController.updateReview(widget.index, 0);
      purchasedController.purchasedContents[widget.index].content.review["보통이에요"] = purchasedController.purchasedContents[widget.index].content.review["보통이에요"]! + 1;
    } else if(reviewController.selectedReview.value == 'dislike') {
      purchasedController.updateReview(widget.index, -1);
      purchasedController.purchasedContents[widget.index].content.review["별로에요"] = purchasedController.purchasedContents[widget.index].content.review["별로에요"]! + 1;
    }
    setState(() {
      isReviewSubmitted = true;
    });


    // TODO : firestore에 리뷰 업데이트 purchasedController.purchasedContents[widget.index].review 값을 기준으로
    print("purchasedController.purchasedContents[widget.index].review: ${purchasedController.purchasedContents[widget.index].review}");

    // TODO : user collection의 firebaseauth의 userid 해당하는 document의 purchasedContents 필드에 index에 해당하는 review 필드 업데이트
    print("firebaseAuth.currentUser!.uid: ${firebaseAuth.currentUser!.uid}");
    print("widget.index: ${widget.index}");

    // TODO : content collection의 docPath에 해당하는 document의 review 필드 업데이트
    print("purchasedController.purchasedContents[widget.index].content.docPath: ${purchasedController.purchasedContents[widget.index].content.docPath}");
  }

  @override
  Widget build(BuildContext context) {

    return
       IconButton(
        onPressed: () {
          // 기존에 리뷰가 등록되었다면 동작하지 않도록 처리
          if ( purchasedController.purchasedContents[widget.index].review == null) {
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
                      color: reviewController.selectedReview.value ==
                          'normal'
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
                      color: reviewController.selectedReview.value ==
                          'dislike'
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
                      submitReview();
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
          color: isReviewSubmitted
              ? Colors.grey
              : Colors.black,
        ),
      );

  }
}