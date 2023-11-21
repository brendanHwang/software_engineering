import 'package:flutter/material.dart';
//리뷰를 남겨주는 버튼 위젯 (다운로드 우측에 위치)
//리뷰를 남겨준 경우 이 버튼은 invisible
//다운로드 버튼 눌렀을 때 Dialog 표시: 다운로드 버튼을 누르면 Dialog가 나타나도록 구현할 거에요.
//
//Dialog에 선택 옵션과 버튼 추가: Dialog에는 사용자가 선택할 수 있는 옵션과 제출, 취소 버튼이 있어야 해요.
//
//리뷰 제출 후 버튼 비활성화: 리뷰를 제출하면 다시 해당 자료의 리뷰를 작성할 수 없도록 버튼을 비활성화해야 해요.

import 'package:get/get.dart';

class ReviewController extends GetxController {
  var selectedReview = RxString('');

  void setSelectedReview(String review) {
    selectedReview(review);
  }
}

class ReviewButton extends StatelessWidget {
  final ReviewController reviewController = Get.put(ReviewController());

  // 리뷰 제출
  void submitReview() {
    // 리뷰 제출 후 리뷰 상태 업데이트
    // 예: selectedReview.value = 'submitted';
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return IconButton(
        onPressed: () {
          // 기존에 리뷰가 등록되었다면 동작하지 않도록 처리
          if (reviewController.selectedReview.value.isEmpty) {
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
          size: 40,
          // 리뷰가 제출된 콘텐츠의 리뷰 버튼은 회색으로 변경
          color: reviewController.selectedReview.value == 'submitted'
              ? Colors.grey
              : Colors.black,
        ),
      );
    });
  }
}
