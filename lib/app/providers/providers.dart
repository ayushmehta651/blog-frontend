import 'package:blog_app/core/notifiers/authentication.notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [...remoteproviders, ...localproviders];

List<SingleChildWidget> remoteproviders = [
  ChangeNotifierProvider(create: (_) => AuthenticationNotifier()),
];

List<SingleChildWidget> localproviders = [];

//Proxy Providers
//Provider => Independent(Remote)
//provider => Dependent(Local)
//A -> B
