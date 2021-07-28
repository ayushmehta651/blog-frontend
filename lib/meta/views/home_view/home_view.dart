import 'package:blog_app/app/routes/routes.dart';
import 'package:blog_app/core/notifiers/authentication.notifier.dart';
import 'package:blog_app/core/notifiers/blogs.notifier.dart';
import 'package:blog_app/core/services/cache.service.dart';
import 'package:blog_app/meta/views/home_view/showpopupforaddingpost.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

//! show Blogs
class _HomeViewState extends State<HomeView> {
  AuthenticationNotifier _authenticationNotifier = AuthenticationNotifier();
  BlogNotifier _blogNotifier = BlogNotifier();
  var username;
  var posts;

  @override
  void initState() {
    super.initState();
    _authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    _blogNotifier = Provider.of<BlogNotifier>(context, listen: false);
    username = _authenticationNotifier.getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    _authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: true);
    _blogNotifier = Provider.of<BlogNotifier>(context, listen: true);
    username = _authenticationNotifier.username;

    _blogNotifier.fetchBlogs(username: username);
    final CacheService _cacheService = new CacheService();
    posts = _blogNotifier.posts;
    // print(posts);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ProfileRoute);
            },
            icon: Icon(Icons.person),
          )
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: "btn1",
              child: Text("Logout"),
              onPressed: () {
                _cacheService.removeCache(context: context, key: "jwtdata");
              }),
          FloatingActionButton(
              heroTag: "btn2",
              child: Icon(Icons.edit),
              onPressed: () => showpopupforaddingpost(context: context)),
        ],
      ),
      body: Container(
          width: screenwidth,
          child: posts != null
              ? ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return posts[index]['post'].length != 0
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                      
                                ListTile(
                                    tileColor: Colors.blueGrey,
                                    title:
                                        Text(posts[index]['post'][0]['title']),
                                    subtitle:
                                        Text(posts[index]['post'][0]['blog']),
                                    trailing: Text(posts[index]['name'])),
                              ],
                            ),
                          )
                        : Container();
                  })
              : Center(child: CircularProgressIndicator())),
    );
  }
}
