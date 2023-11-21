import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/controllers/PurchasedController.dart';
import 'package:software_engineering/screens/Screen.dart';
import 'package:software_engineering/widgets/ReviewButton.dart';
import 'package:software_engineering/widgets/SearchScreen/ContentCard.dart';
import 'package:software_engineering/widgets/ReviewButton.dart' ;

class MyPage extends StatelessWidget {
  MyPage({Key? key}) : super(key: key);
  final purchasedController = Get.find<PurchasedController>();

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
            StreamBuilder(
                stream: purchasedController.getContentStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ContentCard(
                              index: index,
                              content: snapshot.data![index],
                              isSearchedContent: false,
                            ),
                            // 여기에 리뷰 버튼 위젯을 추가합니다.
                            ReviewButton(),
                          ],
                        );
                      },

                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ));
  }
}
