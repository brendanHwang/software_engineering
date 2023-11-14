import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/constants/AppString.dart';
import 'package:software_engineering/models/Content.dart';
import 'package:software_engineering/screens/ContentsInfoScreen.dart';
import 'package:software_engineering/widgets/SearchScreen/IconReviewButtons.dart';
import 'package:software_engineering/widgets/SearchScreen/PayButton.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({Key? key, required this.index, required this.content})
      : super(key: key);
  final int index;
  final Content content;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ContentsInfoScreen(content: content));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  '${index + 1}. ${content.title}\t'
                  '\t${content.contentType}',
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  Text(content.fileName,
                      style: const TextStyle(fontSize: 20, color: Colors.grey)),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),

          const Spacer(),
          IconReviewButtons(
              like: content.getReviewString(AppString.like),
              normal: content.getReviewString(AppString.normal),
              dislike: content.getReviewString(AppString.dislike)),
          const SizedBox(
            width: 50,
          ),
          const PayButton()
        ],
      ),
    );
  }
}
