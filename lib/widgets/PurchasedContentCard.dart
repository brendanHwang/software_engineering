import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:software_engineering/constants/AppString.dart';
import 'package:software_engineering/models/PurchasedContent.dart';
import 'package:software_engineering/widgets/DownloadButton.dart';
import 'package:software_engineering/widgets/IconReviewButton.dart';
import 'package:software_engineering/widgets/ReviewButton.dart';
import 'package:software_engineering/widgets/SearchScreen/IconReviewView.dart';

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
                  width: 30,
                  child: Text('${index + 1}.',
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                SizedBox(
                  width: 350,
                  child: Text(
                    purchasedContent.content.title!,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const Gap(10),
                Text(
                  '${purchasedContent.purchasedDateTime.year}/${purchasedContent.purchasedDateTime.month}/${purchasedContent.purchasedDateTime.day}',
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ],
            ),
            const Gap(
              10,
            ),
            Row(
              children: [
                const Gap(
                  50,
                ),
                SizedBox(
                  width: 100,
                  child: Text(purchasedContent.content.contentType!,
                      style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                ),
                const Gap(
                  50,
                ),
                Text(purchasedContent.content.fileName!,
                    style: const TextStyle(fontSize: 20, color: Colors.grey)),
              ],
            ),
            const Gap(
               30,
            ),
          ],
        ),
        const Spacer(),
        IconReviewView(
            like: purchasedContent.content.getReviewString(AppString.like),
            normal: purchasedContent.content.getReviewString(AppString.normal),
            dislike:
                purchasedContent.content.getReviewString(AppString.dislike)),
        const Gap(25),
        DownloadButton(docPath: purchasedContent.content.docPath),
        ReviewButton(),
      ],
    );
  }
}
