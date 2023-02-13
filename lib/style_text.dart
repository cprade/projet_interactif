import 'package:flutter/material.dart';

class StyleText extends StatelessWidget {
  final String? text;
  const StyleText({Key? key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
