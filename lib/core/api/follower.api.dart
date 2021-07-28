import 'dart:convert';
import 'package:blog_app/app/routes/api.routes.dart';
import 'package:http/http.dart' as http;

class FollowerAPI {
  final client = http.Client();

  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*",
  };

  Future fetchFollower({required String username}) async {
    final subUrl = "/userfollower/getFollower";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.post(uri,
        headers: headers,
        body: jsonEncode({
          "username": username,
        }));
    final body = response.body;
    return body;
  }
}
