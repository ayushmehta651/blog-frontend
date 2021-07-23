import 'package:blog_app/app/shared/colors.dart';
import 'package:blog_app/app/shared/fonts.dart';
import 'package:blog_app/core/notifiers/authentication.notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

//! For displaying username, followers, following, suggestions
class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
     var authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: true);
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(80.0),
            child: Card(
              elevation: 10.0,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "username",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: CustomColors.yellowColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: CustomFonts.MONTSERRAT),
                      ),
                      Text(
                        "Followers",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: CustomColors.yellowColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: CustomFonts.MONTSERRAT),
                      ),
                      Text(
                        "Following",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: CustomColors.yellowColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: CustomFonts.MONTSERRAT),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Consumer<AuthenticationNotifier>(
                        builder: (context, auth, _ ) {
                      return Text(
                        auth.username,
                        style: TextStyle(
                            color: CustomColors.yellowColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: CustomFonts.MONTSERRAT),
                      );
                    })
                  ],
                ),
              ]),
            )));
  }
}
