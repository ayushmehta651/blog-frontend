import 'dart:convert';
import 'package:blog_app/app/routes/api.routes.dart';
import 'package:http/http.dart' as http;

class AuthenticationAPI {
  final client = http.Client();
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*",
  };

  Future createAccount(
      {required String useremail,
      required String username,
      required String userpassword}) async {
    final subUrl = "/user/signup";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.post(uri,
        headers: headers,
        body: jsonEncode({
          "username": username,
          "useremail": useremail,
          "userpassword": userpassword
        }));
    final body = response.body;
    return body;
  }

  Future login(
      {required String useremail, required String userpassword}) async {
    final subUrl = "/user/login";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.post(uri,
        headers: headers,
        body: jsonEncode(
            {"useremail": useremail, "newuserpassword": userpassword}));
    final body = response.body;
    
    final statusCode = response.statusCode;
    if (statusCode == 200) {
      return body;
    }
  }
}
