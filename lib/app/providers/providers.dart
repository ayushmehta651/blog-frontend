import 'package:blog_app/core/notifiers/addPost.notifier.dart';
import 'package:blog_app/core/notifiers/authentication.notifier.dart';
import 'package:blog_app/core/notifiers/blogs.notifier.dart';
import 'package:blog_app/core/notifiers/follower.notifier.dart';
import 'package:blog_app/core/notifiers/following.notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [...remoteproviders, ...localproviders];

List<SingleChildWidget> remoteproviders = [
  ChangeNotifierProvider(create: (_) => AuthenticationNotifier()),
  ChangeNotifierProvider(create: (_) => FollowerNotifier()),
  ChangeNotifierProvider(create: (_) => FollowingNotifier()),
  ChangeNotifierProvider(create: (_) => BlogNotifier()),
  ChangeNotifierProvider(create: (_) => AddNotifier()),
];

List<SingleChildWidget> localproviders = [];

//Proxy Providers
//Provider => Independent(Remote)
//provider => Dependent(Local)
//A -> B
