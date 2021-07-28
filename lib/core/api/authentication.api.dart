import 'dart:convert';
import 'package:blog_app/app/routes/api.routes.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationAPI {
  final client = http.Client();

  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*",
  };

  Future getAllUsernames() async {
    final subUrl = "/user/get-all-usernames";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.get(uri,
        headers: headers);
    final dynamic body = response.body;
    final Map<String,dynamic> parsedData = await jsonDecode(body);
    final data = parsedData['data'];
    bool isReceived = parsedData['received'];
    if(isReceived){
      return data;
    }
  }

  Future getUserDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final jwttoken = prefs.getString("jwtdata");
    final subUrl = "/user/verify";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.post(uri,
        headers: headers, body: jsonEncode({"jwttoken": jwttoken}));
    final body = response.body;
    return body;
  }

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