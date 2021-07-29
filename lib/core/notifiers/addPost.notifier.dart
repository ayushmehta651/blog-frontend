import 'dart:convert';
import 'dart:io';
import 'package:blog_app/app/shared/colors.dart';
import 'package:blog_app/app/shared/text_styles.dart';
import 'package:blog_app/core/api/addpost.api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddNotifier extends ChangeNotifier {
  final AddPostAPI _addPostAPI = new AddPostAPI();

  bool _added = false;
  String _message = "";

  bool get added => _added;
  String get message => _message;

  Future AddPost(
      {required BuildContext context,
      required String username,
      required String title,
      required String blog}) async {
    try {
      await _addPostAPI.AddPost(username: username, title: title, blog: blog)
          .then((value) async {
        final Map<String, dynamic> parsedData =
            await jsonDecode(value.toString());

        _added = parsedData['added'];
        _message = parsedData['message'];

        print(_message);

        if (_added) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.deepOrangeAccent,
              content: Text("Post Added", style: CustomTextStyle.bodyText1)));
          notifyListeners();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: CustomColors.bgColor,
              content: Text("Something went wrong",
                  style: CustomTextStyle.bodyText1)));
          print(parsedData['data']);
        }
      });
    } on SocketException {} catch (error) {
      print(error);
    }
  }
}
