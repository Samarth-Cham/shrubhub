import 'package:flutter/material.dart';
import 'package:shrub_hub/Components/myButtons.dart';
import 'package:shrub_hub/Components/myTextField.dart';
import 'package:shrub_hub/firebaseAuthFunctions.dart';

import 'Components/Data/PostData.dart';
import 'Components/postWidget.dart';

class addPost extends StatefulWidget {
  const addPost({Key? key}) : super(key: key);

  @override
  State<addPost> createState() => _addPostState();
}

class _addPostState extends State<addPost> {
  TextEditingController caption = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          " Shrub Hub",
          style: TextStyle(
              color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 26),
        )),
        elevation: 0,
        backgroundColor: Color.fromRGBO(124, 157, 69, 1),
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            MyTextField(
              controller: caption,
              iconData: Icons.add,
              hintText: "caption",
              showIcon: true,
              width: 200,
            ),
            SizedBox(
              height: 30,
            ),
            customButton(
                buttonText: "Create post",
                onTap: () {
                  createPost(postData[0]);
                },
                buttonHeight: 55,
                buttonWidth: 130)
          ],
        ),
      )),
      backgroundColor: Color.fromRGBO(124, 157, 69, 1),
    );
  }
}
