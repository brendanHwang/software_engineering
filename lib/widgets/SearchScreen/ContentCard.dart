import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/constants/AppString.dart';
import 'package:software_engineering/models/Content.dart';
import 'package:software_engineering/screens/ContentsInfoScreen.dart';
import 'package:software_engineering/widgets/DownloadButton.dart';
import 'package:software_engineering/widgets/IconReviewButton.dart';
import 'package:software_engineering/widgets/SearchScreen/IconReviewView.dart';
import 'package:software_engineering/widgets/PayButton.dart';

class ContentCard extends StatelessWidget {
  const ContentCard(
      {Key? key,
      required this.index,
      required this.content,
      this.isSearchedContent = true})
      : super(key: key);
  final int index;
  final Content content;
  final bool isSearchedContent; // isSearchContent가 true면 검색결과, false면 구매내역

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isSearchedContent)
          Get.to(() => ContentsInfoScreen(content: content));
      },
      child: Row(
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
                      content.title!,
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
                    child: Text('${content.contentType}',
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                  ),
                  //  구매내역은 경우 언제 구매했는지 표시
                  if (!isSearchedContent)
                    Text(
                      '${content.purchasedDateTime!.year}/${content.purchasedDateTime!.month}/${content.purchasedDateTime!.day}',
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
                  Text(content.fileName!,
                      style: const TextStyle(fontSize: 20, color: Colors.grey)),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
          const Spacer(),
          isSearchedContent
              ? IconReviewView(
                  like: content.getReviewString(AppString.like),
                  normal: content.getReviewString(AppString.normal),
                  dislike: content.getReviewString(AppString.dislike))
              : IconReviewButton(
                  like: content.getReviewString(AppString.like),
                  normal: content.getReviewString(AppString.normal),
                  dislike: content.getReviewString(AppString.dislike)),
          const SizedBox(
            width: 50,
          ),
          isSearchedContent ? const PayButton() : const DownloadButton(),
        ],
      ),
    );
  }
}
