import 'package:blog_app/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  Future<String?> readCache({required String key}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? cachedData = await sharedPreferences.getString(key);
    return cachedData;
  }

  Future writeCache({required String key, required String value}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString(key, value);
  }

  Future removeCache(
      {required BuildContext context, required String key}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.remove(key).whenComplete(() {
      Navigator.of(context).pushNamed(LoginRoute);
    });
  }
}
