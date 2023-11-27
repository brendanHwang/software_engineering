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
            purchasedController.purchasedContents.isEmpty
                ? const Center(
                    child: Text(
                      "구매 내역이 없습니다.",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          color: Color.fromARGB(255, 122, 122, 122)),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: purchasedController.purchasedContents.length,
                    itemBuilder: (context, index) {
                      final reviewController = reviewControllers[
                          purchasedController.purchasedContents[index].content
                              .docPath!] ??= ReviewController();
                      return PurchasedContentCard(
                        index: purchasedController.purchasedContents.length -
                            index -
                            1,
                        purchasedContent: purchasedController.purchasedContents[
                            purchasedController.purchasedContents.length -
                                index -
                                1],
                        reviewController: reviewController,
                      );
                    },
                  ),
          ],
        ));
  }
}
