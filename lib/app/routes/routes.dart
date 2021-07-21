import 'package:blog_app/meta/views/auth/login_view.dart';
import 'package:blog_app/meta/views/auth/signup_view.dart';
import 'package:blog_app/meta/views/decider_view/decider_view.dart';
import 'package:blog_app/meta/views/home_view/home_view.dart';

final String LoginRoute = "/login";
final String SignupRoute = "/signup";
final String HomeRoute = "/";
final String DeciderRoute = "/decider";

final routes = {
  HomeRoute: (context) => HomeView(),
  LoginRoute: (context) => LoginView(),
  SignupRoute: (context) => SignupView(),
  DeciderRoute: (context) => DeciderView(),
};
