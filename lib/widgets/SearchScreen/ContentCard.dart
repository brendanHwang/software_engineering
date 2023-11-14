import 'package:flutter/material.dart';
import 'package:software_engineering/constants/AppString.dart';
import 'package:software_engineering/models/Content.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({Key? key, required this.index, required this.content})
      : super(key: key);
  final int index;
  final Content content;

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey[300],
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const Icon(Icons.tag_faces_outlined, size: 40, color: Colors.black),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 50,
                child: Text(content.getReviewString(AppString.like),
                    style: const TextStyle(fontSize: 20, color: Colors.black)),
              ),
              const SizedBox(
                width: 15,
              ),
              const Icon(Icons.sentiment_neutral_outlined,
                  size: 40, color: Colors.black),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 50,
                child: Text(content.getReviewString(AppString.normal),
                    style: const TextStyle(fontSize: 20, color: Colors.black)),
              ),
              const SizedBox(
                width: 15,
              ),
              const Icon(Icons.sentiment_dissatisfied_outlined,
                  size: 40, color: Colors.black),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 50,
                child: Text(content.getReviewString(AppString.dislike),
                    style: const TextStyle(fontSize: 20, color: Colors.black)),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 50,
        ),
        IconButton(
            onPressed: () {},
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.payment_outlined),
              iconSize: 40,
              color: Colors.black,
            )),
      ],
    );
  }
}
