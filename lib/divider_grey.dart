import 'package:flutter/material.dart';

class DividerGrey extends StatelessWidget {
  const DividerGrey({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.grey,
      height: 10,
      thickness: 1,
    );
  }
}
