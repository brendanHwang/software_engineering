import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/widgets/DownloadButton.dart';

class IconReviewButton extends StatelessWidget {
  const IconReviewButton(
      {Key? key,
      required this.like,
      required this.normal,
      required this.dislike,
      required this.docPath})
      : super(key: key);
  final String like;
  final String normal;
  final String dislike;
  final String docPath;

  @override
  Widget build(BuildContext context) {
    List<String> pathParts = docPath.split('/');
    String docID = pathParts.length > 1 ? pathParts[1] : '';

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey[300],
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
              icon: const Icon(Icons.tag_faces_outlined,
                  size: 40, color: Colors.black),
              onPressed: () {
                //포인트 추가
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                minimumSize: MaterialStateProperty.all(Size.zero),
              )),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            width: 50,
            //Streambuilder로 데이터 가져옴
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('content')
                  .doc(docID)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                      snapshot) {
                if (snapshot.hasError) {
                  return const Text('데이터를 가져오는 중에 오류가 발생했습니다.');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                if (!snapshot.hasData || snapshot.data == null) {
                  return const Text('데이터가 없습니다.');
                }

                Map<String, dynamic>? reviewMap =
                    snapshot.data!.data()?['review'];

                if (reviewMap == null) {
                  return const Text('리뷰 데이터가 없습니다.');
                }

                int likeCount = reviewMap['좋아요'] ?? 0;
                return Text('$likeCount',
                    style: const TextStyle(fontSize: 20, color: Colors.black));
              },
            ),
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
              )),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            width: 50,
            //Streambuilder로 데이터 가져옴
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('content')
                  .doc(docID)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                      snapshot) {
                if (snapshot.hasError) {
                  return const Text('데이터를 가져오는 중에 오류가 발생했습니다.');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                if (!snapshot.hasData || snapshot.data == null) {
                  return const Text('데이터가 없습니다.');
                }

                Map<String, dynamic>? reviewMap =
                    snapshot.data!.data()?['review'];

                if (reviewMap == null) {
                  return const Text('리뷰 데이터가 없습니다.');
                }

                int likeCount = reviewMap['보통이에요'] ?? 0;
                return Text('$likeCount',
                    style: const TextStyle(fontSize: 20, color: Colors.black));
              },
            ),
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
            //Streambuilder로 데이터 가져옴
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('content')
                  .doc(docID)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                      snapshot) {
                if (snapshot.hasError) {
                  return const Text('데이터를 가져오는 중에 오류가 발생했습니다.');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                if (!snapshot.hasData || snapshot.data == null) {
                  return const Text('데이터가 없습니다.');
                }

                Map<String, dynamic>? reviewMap =
                    snapshot.data!.data()?['review'];

                if (reviewMap == null) {
                  return const Text('리뷰 데이터가 없습니다.');
                }

                int likeCount = reviewMap['싫어요'] ?? 0;
                return Text('$likeCount',
                    style: const TextStyle(fontSize: 20, color: Colors.black));
              },
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
