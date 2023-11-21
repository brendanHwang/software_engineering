import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/widgets/DownloadButton.dart';


class IconReviewButton extends StatelessWidget {
  const IconReviewButton(
      {Key? key,
      required this.like,
      required this.normal,
      required this.dislike})
      : super(key: key);
  final String like;
  final String normal;
  final String dislike;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey[300],
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.tag_faces_outlined, size: 40, color: Colors.black),
            onPressed: () {
              //포인트 추가

            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              minimumSize: MaterialStateProperty.all(Size.zero),
            )
          ),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            width: 50,
            child: Text(like,
                style: const TextStyle(fontSize: 20, color: Colors.black)),
          ),
          const SizedBox(
            width: 15,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.sentiment_neutral_outlined,
                  size: 40, color: Colors.black),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                minimumSize: MaterialStateProperty.all(Size.zero),
              )
          ),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            width: 50,
            child: Text(normal,
                style: const TextStyle(fontSize: 20, color: Colors.black)),
          ),
          const SizedBox(
            width: 15,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.sentiment_dissatisfied_outlined,
                  size: 40, color: Colors.black),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                minimumSize: MaterialStateProperty.all(Size.zero),
              )),

          const SizedBox(
            width: 15,
          ),
          SizedBox(
            width: 50,
            child: Text(dislike,
                style: const TextStyle(fontSize: 20, color: Colors.black)),
          ),
          const SizedBox(
            width: 15,
          ),

        ],
      ),
    );
  }
}
