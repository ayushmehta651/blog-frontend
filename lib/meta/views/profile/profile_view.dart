import 'dart:convert';
import 'package:blog_app/app/shared/colors.dart';
import 'package:blog_app/app/shared/fonts.dart';
import 'package:blog_app/app/shared/text_styles.dart';
import 'package:blog_app/core/api/add.api.dart';
import 'package:blog_app/core/notifiers/authentication.notifier.dart';
import 'package:blog_app/core/notifiers/follower.notifier.dart';
import 'package:blog_app/core/notifiers/following.notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

//! For displaying username, followers, following, suggestions
class _ProfileViewState extends State<ProfileView> {
  AuthenticationNotifier _authenticationNotifier = AuthenticationNotifier();
  FollowerNotifier _followerNotifier = FollowerNotifier();
  FollowingNotifier _followingNotifier = FollowingNotifier();
  AddAPI _addAPI = AddAPI();

  var username;
  var _usernames;
  var listLength = 0;
  var cntFollower = "0";
  var cntFollowing = "0";

  @override
  void initState() {
    _authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    _followerNotifier = Provider.of<FollowerNotifier>(context, listen: false);
    _followingNotifier = Provider.of<FollowingNotifier>(context, listen: false);

    _usernames = _authenticationNotifier.getAllUsernames();
    username = _authenticationNotifier.getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: true);
    _followerNotifier = Provider.of<FollowerNotifier>(context, listen: true);
    _followingNotifier = Provider.of<FollowingNotifier>(context, listen: true);

    username = _authenticationNotifier.username;
    _followerNotifier.fetchFollower(username: username, context: context);
    _followingNotifier.fetchFollowing(context: context, username: username);

    _usernames = _authenticationNotifier.usernames;
    cntFollower = _followerNotifier.count.toString();
    cntFollowing = _followingNotifier.count.toString();

    _add(String followerusername) async {
      //! Add the user and frienduser to follower and following list
      await _addAPI
          .addFollowerFollowing(
              username: username, followerusername: followerusername)
          .then((value) async {
        final Map<String, dynamic> parsedData =
            await jsonDecode(value.toString());

        if (parsedData['added'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.deepOrangeAccent,
              content: Text("Added to the list!",
                  style: CustomTextStyle.bodyText2)));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.deepOrangeAccent,
              content: Text(parsedData['message'],
                  style: CustomTextStyle.bodyText2)));
        }
      });
    }

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
                      Column(
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
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              username,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: CustomFonts.MONTSERRAT),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Followers",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: CustomColors.yellowColor,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: CustomFonts.MONTSERRAT),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              cntFollower,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: CustomFonts.MONTSERRAT),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Following",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: CustomColors.yellowColor,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: CustomFonts.MONTSERRAT),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              cntFollowing,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: CustomFonts.MONTSERRAT),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: Text(
                              "Suggestions",
                              style: TextStyle(
                                  color: CustomColors.yellowColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: CustomFonts.MONTSERRAT),
                            ),
                          ),
                          Container(
                              width: 500,
                              height: 400.0,
                              child: _usernames.length != 0
                                  ? ListView.builder(
                                      itemCount: _usernames.length,
                                      itemBuilder: (context, index) {
                                        return _usernames[index]['username'] ==
                                                username
                                            ? Container()
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: ListTile(
                                                    tileColor: Colors.black,
                                                    leading: Text(
                                                        _usernames[index]
                                                                ['username']
                                                            .toString()),
                                                    trailing: TextButton(
                                                        onPressed: () => _add(
                                                            _usernames[index]
                                                                    ['username']
                                                                .toString()),
                                                        child: Text("FOLLOW"))),
                                              );
                                      })
                                  : Center(child: CircularProgressIndicator())),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            )));
  }
}
