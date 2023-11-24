import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:software_engineering/constants/AppString.dart';
import 'package:software_engineering/models/Content.dart';
import 'package:software_engineering/screens/ContentsInfoScreen.dart';
import 'package:software_engineering/widgets/PayButton.dart';
import 'package:software_engineering/widgets/SearchScreen/IconReviewView.dart';

class SearchContentCard extends StatelessWidget {
  const SearchContentCard(
      {Key? key,
        required this.index,
        required this.content,
        })
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
                    width: 300,
                    child: Text(
                      content.title!,
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
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
                    child: Text(content.contentType!,
                        style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                  ),
                  const Gap(
                    50,
                  ),
                  Text(content.fileName!,
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
              like: content.getReviewString(AppString.like),
              normal: content.getReviewString(AppString.normal),
              dislike: content.getReviewString(AppString.dislike)),
          const Gap(
            25,
          ),
          // PayButton, DownloadButton 문서 ID 인자로 받을 것임
          PayButton(docPath: content.docPath)
        ],
      ),
    );
  }
}

