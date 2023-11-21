import 'package:flutter/material.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          // TODO: Download 구현
        },
        icon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.download),
          iconSize: 40,
          color: Colors.black,
        ));
  }
}
