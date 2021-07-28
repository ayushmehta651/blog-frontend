import 'dart:convert';
import 'dart:io';
import 'package:blog_app/core/api/follower.api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FollowerNotifier extends ChangeNotifier {
  final FollowerAPI _followerAPI = new FollowerAPI();

  bool _received = false;
  String _count = "";
  dynamic _followerData;

  bool get received => _received;
  String get count => _count;
  dynamic get followerData => _followerData;

  Future fetchFollower(
      {required BuildContext context, required String username}) async {
    try {
      await _followerAPI.fetchFollower(username: username).then((value) async {
        final Map<String, dynamic> parsedData =
            await jsonDecode(value.toString());

        _received = parsedData['received'];
        _count = parsedData['count'].toString();
        _followerData = parsedData['data'];
        
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
