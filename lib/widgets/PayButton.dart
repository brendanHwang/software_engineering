import 'package:flutter/material.dart';

class PayButton extends StatelessWidget {
  const PayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.payment_outlined),
          iconSize: 40,
          color: Colors.black,
        ));
  }
}
