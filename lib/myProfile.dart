import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shrub_hub/Components/myTextField.dart';
import 'package:shrub_hub/savedPost.dart';
import 'package:shrub_hub/Settings.dart';

import 'Components/Data/user.dart';
import 'Components/myButtons.dart';

class myProfile extends StatefulWidget {
  const myProfile({
    Key? key,
  }) : super(key: key);
  @override
  State<myProfile> createState() => _myProfileState();
}

class _myProfileState extends State<myProfile> {
  // TextEditingController username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "My Profile",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
            textAlign: TextAlign.center,
          ),
        ),
        elevation: 0,
        actions: [
          CircleAvatar(
            child: Icon(Icons.person),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/img2.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // MyTextField(
              //     controller: username,
              //     iconData: Icons.text_fields,
              //     hintText: AutofillHints.username,
              //     width: 200,
              //     showIcon: false),
              SizedBox(),
              customButton(
                  buttonText: "Username",
                  onTap: () => () {},
                  buttonHeight: 68,
                  buttonWidth: 290),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customButton(
                      buttonText: "My Posts",
                      onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PersonalPosts(
                                          savedPosts: currentUser.myPost,
                                          isSavedPost: false,
                                        )))
                          },
                      buttonHeight: 68,
                      buttonWidth: 118),
                  customButton(
                      buttonText: "Saved Posts",
                      onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PersonalPosts(
                                          savedPosts: currentUser.savedPost,
                                          isSavedPost: true,
                                        )))
                          },
                      buttonHeight: 68,
                      buttonWidth: 118),
                ],
              ),
              customButton(
                  buttonText: "Edit Profile",
                  onTap: () => () {},
                  buttonHeight: 68,
                  buttonWidth: 200),
              customButton(
                  buttonText: "Settings",
                  onTap: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Settings()))
                      },
                  buttonHeight: 68,
                  buttonWidth: 118),
              SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}
