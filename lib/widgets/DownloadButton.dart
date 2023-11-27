import 'dart:html';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DownloadButton extends StatelessWidget {
  final String? docPath;
  const DownloadButton({Key? key, required this.docPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: IconButton(
          onPressed: () async {
            if (docPath != null) {
              List<String> pathParts = docPath!.split('/');
              String docID = pathParts.length > 1 ? pathParts[1] : '';

              DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
                  .collection('content')
                  // 나중에 인자로 받아올 것임
                  .doc(docID)
                  .get();
              Map<String, dynamic>? data =
                  docSnapshot.data() as Map<String, dynamic>?;
              String? filePath = data?['filePath'];

              if (filePath != null && filePath.isNotEmpty) {
                String downloadURL = await FirebaseStorage.instance
                    .ref(filePath)
                    .getDownloadURL();

                AnchorElement anchorElement = AnchorElement(href: downloadURL);
                anchorElement.download = '';
                anchorElement.click();
              } else {
                print('File not found');
              }
            }
          },
          icon: const Icon(Icons.download),
          iconSize: 40,
          color: Colors.black,
        ));
  }
}
