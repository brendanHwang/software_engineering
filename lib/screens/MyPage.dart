import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/controllers/PurchasedController.dart';
import 'package:software_engineering/screens/Screen.dart';
import 'package:software_engineering/widgets/PurchasedContentCard.dart';
import 'package:software_engineering/widgets/ReviewButton.dart';

class MyPage extends StatelessWidget {
  MyPage({Key? key}) : super(key: key);
  final purchasedController = Get.find<PurchasedController>();
  final Map<String, ReviewController> reviewControllers = {};

  @override
  Widget build(BuildContext context) {
    return Screen(
        isMyPage: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            const Text('구매 내역',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const SizedBox(
              height: 60,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: purchasedController.purchasedContents.length,
              itemBuilder: (context, index) {
                final reviewController = reviewControllers[purchasedController
                    .purchasedContents[index]
                    .content
                    .docPath!] ??= ReviewController();
                return PurchasedContentCard(
                  index: index,
                  purchasedContent:
                      purchasedController.purchasedContents[index],
                  reviewController: reviewController,
                );
              },
            ),
          ],
        ));
  }
}
