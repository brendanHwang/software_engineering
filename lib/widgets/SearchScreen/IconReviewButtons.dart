import 'package:flutter/material.dart';
import 'package:software_engineering/constants/AppString.dart';

class IconReviewButtons extends StatelessWidget {
  const IconReviewButtons({Key? key, required this.like, required this.normal, required this.dislike}) : super(key: key);
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
          const Icon(Icons.tag_faces_outlined, size: 40, color: Colors.black),
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
          const Icon(Icons.sentiment_neutral_outlined,
              size: 40, color: Colors.black),
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
          const Icon(Icons.sentiment_dissatisfied_outlined,
              size: 40, color: Colors.black),
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
