import 'dart:convert';
import 'dart:io';
import 'package:blog_app/core/api/following.api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FollowingNotifier extends ChangeNotifier {
  final FollowingAPI _followerAPI = new FollowingAPI();

  bool _received = false;
  String _count = "";
  dynamic _followerData;

  bool get received => _received;
  String get count => _count;
  dynamic get followerData => _followerData;

  Future fetchFollowing(
      {required BuildContext context, required String username}) async {
    try {
      await _followerAPI.fetchFollowing(username: username).then((value) async {
        final Map<String, dynamic> parsedData =
            await jsonDecode(value.toString());

        // print(parsedData);

        _received = parsedData['received'];
        _count = parsedData['count'].toString();
        _followerData = parsedData['data'];

        if (_received) {
          notifyListeners();
        } else {
          // print(parsedData['data']);
        }
      });
    } on SocketException {} catch (error) {
      print(error);
    }
  }
}
