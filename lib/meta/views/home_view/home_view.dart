import 'package:blog_app/core/services/cache.service.dart';
import 'package:blog_app/meta/views/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

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
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: ProfileView(),
                      type: PageTransitionType.rightToLeft));
            },
            icon: Icon(Icons.person),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Text("Logout"),
          onPressed: () {
            _cacheService.removeCache(context: context, key: "jwtdata");
          }),
      body: Text("Data"),
    );
  }
}
