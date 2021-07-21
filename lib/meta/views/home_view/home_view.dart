import 'package:blog_app/core/services/cache.service.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

//! show Blogs
class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final CacheService _cacheService = new CacheService();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Text("Logout"),
          onPressed: () {
            _cacheService.removeCache(context: context, key: "jwtdata");
          }),
      body: Text("Data"),
    );
  }
}
