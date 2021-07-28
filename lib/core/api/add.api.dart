import 'dart:convert';
import 'package:blog_app/app/routes/api.routes.dart';
import 'package:http/http.dart' as http;

class AddAPI {
  final client = http.Client();
  bool _received = false;

  bool get received => _received;

  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*",
  };

  Future addFollowerFollowing(
      {required String username, required String followerusername}) async {
    final subUrl1 = "/userfollower/addFollower";
    final subUrl2 = "/userfollowing/addFollowing";
    final Uri uri1 = Uri.parse(BASEURL + subUrl1);
    final Uri uri2 = Uri.parse(BASEURL + subUrl2);

    //!Adding to follower table
    final http.Response response1 = await client.post(uri1,
        headers: headers,
        body: jsonEncode(
            {"myusername": followerusername, "friendusername": username}));
    final body1 = response1.body;

    // print(body1.runtimeType);

    //!Adding to following table

    final http.Response response2 = await client.post(uri2,
        headers: headers,
        body: jsonEncode(
            {"myusername": username, "friendusername": followerusername}));
    // final body2 = response2.body;
    return body1;
  }
}
