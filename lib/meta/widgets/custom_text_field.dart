import 'package:blog_app/app/shared/colors.dart';
import 'package:blog_app/app/shared/text_styles.dart';
import 'package:flutter/material.dart';

class CustomWidgets {
  static stylishTextField(
      String text, TextEditingController textEditingController) {
    return TextField(
      controller: textEditingController,
      style: CustomTextStyle.bodyText1,
      decoration: new InputDecoration(
          filled: true,
          hintText: text,
          hintStyle:
              new TextStyle(color: CustomColors.textColor, fontSize: 14.0),
          fillColor: CustomColors.bgColor,
          border: new OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(const Radius.circular(15.0)))),
    );
  }
}
