import 'package:flutter/material.dart';
import 'package:software_engineering/constants/AppString.dart';
import 'package:software_engineering/models/PurchasedContent.dart';
import 'package:software_engineering/widgets/DownloadButton.dart';
import 'package:software_engineering/widgets/IconReviewButton.dart';
import 'package:software_engineering/widgets/ReviewButton.dart';

class PurchasedContentCard extends StatelessWidget {
  const PurchasedContentCard({
    Key? key,
    required this.index,
    required this.purchasedContent,
  }) : super(key: key);
  final int index;
  final PurchasedContent purchasedContent;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 50,
                  child: Text('${index + 1}.',
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                SizedBox(
                  width: 300,
                  child: Text(
                    purchasedContent.content.title!,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Text(purchasedContent.content.contentType!,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                ),
                //  구매내역은 경우 언제 구매했는지 표시
                //TODO : 구매내역은 경우 언제 구매했는지 표시

                Text(
                  '${purchasedContent.purchasedDateTime.year}/${purchasedContent.purchasedDateTime.month}/${purchasedContent.purchasedDateTime.day}',
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 50,
                ),
                Text(purchasedContent.content.fileName!,
                    style: const TextStyle(fontSize: 20, color: Colors.grey)),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
        const Spacer(),
        IconReviewButton(
            like: purchasedContent.content.getReviewString(AppString.like),
            normal: purchasedContent.content.getReviewString(AppString.normal),
            dislike:
                purchasedContent.content.getReviewString(AppString.dislike)),
        const SizedBox(
          width: 50,
        ),
        DownloadButton(docPath: purchasedContent.content.docPath),
        ReviewButton(),
      ],
    );
  }
}
