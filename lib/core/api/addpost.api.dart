import 'dart:convert';
import 'package:blog_app/app/routes/api.routes.dart';
import 'package:http/http.dart' as http;

class AddPostAPI {
  final client = http.Client();

  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*",
  };

  Future AddPost(
      {required String username,
      required String title,
      required String blog}) async {
    final subUrl = "/userpost/addpost";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.post(uri,
        headers: headers,
        body: jsonEncode({"username": username, "title": title, "blog": blog}));
    final body = response.body;
    return body;
  }
}
