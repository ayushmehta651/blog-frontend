import 'package:flutter/material.dart';

customTextField(
    {required String hintText,
    required double width,
    required TextEditingController textEditingController}) {
  return Container(
    width: width,
    child: TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        border:
            OutlineInputBorder(borderSide: new BorderSide(color: Colors.red)),
        hintText: hintText,
      ),
    ),
  );
}
