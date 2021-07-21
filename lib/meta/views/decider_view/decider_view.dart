import 'package:blog_app/core/services/cache.service.dart';
import 'package:blog_app/meta/views/auth/login_view.dart';
import 'package:blog_app/meta/views/home_view/home_view.dart';
import 'package:flutter/material.dart';

class DeciderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CacheService _cacheService = new CacheService();
    return FutureBuilder(
      future: _cacheService.readCache(key: "jwtdata"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeView();
        } else {
          return LoginView();
        }
      },
    );
  }
}
