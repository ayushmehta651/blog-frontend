import 'dart:convert';
import 'dart:io';
import 'package:blog_app/core/api/blogs.api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BlogNotifier extends ChangeNotifier {
  final BlogsAPI _blogsAPI = new BlogsAPI();

  bool _received = false;
  dynamic _posts;

  bool get received => _received;
  dynamic get posts => _posts;

  Future fetchBlogs({required String username}) async {
    try {
      await _blogsAPI.fetchBlogs(username: username).then((value) async {
        final Map<String, dynamic> parsedData =
            await jsonDecode(value.toString());

        _received = parsedData['received'];
        _posts = parsedData['data'];

        // print(_posts);

        if (_received) {
          notifyListeners();
        } else {
          print(parsedData['data']);
        }
      });
    } on SocketException {} catch (error) {
      print(error);
    }
  }
}
