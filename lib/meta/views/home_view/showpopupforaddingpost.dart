import 'package:blog_app/app/shared/colors.dart';
import 'package:blog_app/app/shared/dimensions.dart';
import 'package:blog_app/core/notifiers/addPost.notifier.dart';
import 'package:blog_app/core/notifiers/authentication.notifier.dart';
import 'package:blog_app/meta/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

showpopupforaddingpost({required BuildContext context}) {
  final title = TextEditingController();
  final blog = TextEditingController();
  var _addNotifier = Provider.of<AddNotifier>(context, listen: false);
  var authenticationNotifier =
      Provider.of<AuthenticationNotifier>(context, listen: false);

  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Builder(
                builder: (context) => Container(
                      height: 500,
                      width: 500,
                      color: CustomColors.darkColor,
                      child: SingleChildScrollView(
                          physics: ClampingScrollPhysics(),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        color: CustomColors.whiteColor,
                                      )),
                                ],
                              ),
                              vSizedBox2,
                              Text(
                                "Create your Blog",
                              ),
                              vSizedBox3,
                              customTextField(
                                  width: 400,
                                  textEditingController: title,
                                  hintText: "title"),
                              vSizedBox3,
                              customTextField(
                                  width: 400,
                                  textEditingController: blog,
                                  hintText: "Blog"),
                              vSizedBox3,
                              ElevatedButton(
                                  onPressed: () async {
                                    print(authenticationNotifier.username);
                                    await _addNotifier.AddPost(
                                            context: context,
                                            username:
                                                authenticationNotifier.username,
                                            title: title.text,
                                            blog: blog.text)
                                        .then(
                                            (value) => Navigator.pop(context));
                                  },
                                  child: Text("Post")),
                            ],
                          )),
                    )),
          ));
}
