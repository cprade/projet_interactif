import 'package:flutter/material.dart';

TextField myTextField(
    {required TextEditingController controller,
    required String hint,
    bool isSecret = false,
    TextInputType type: TextInputType.text}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    keyboardType: type,
    obscureText: isSecret,
    onSubmitted: ((newValue) {
      // updateUser();
    }),
  );
}
