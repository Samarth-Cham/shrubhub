import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shrub_hub/forum.dart';
import 'package:shrub_hub/mainTabView.dart';

import 'Components/Data/PostData.dart';

Future<void> AuthCredentials(
    String email, String password, BuildContext context) async {
  print(email);
  print(password);
  UserCredential user = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);
  user.user?.sendEmailVerification();
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: ((context) => tabView())));
}

Future createPost(PostData Post) async {
  final postsDoc = FirebaseFirestore.instance.collection('posts').doc();
  final json = Post.toJson();
  await postsDoc.set(json);
}

Stream<List<PostData>> readPosts() =>
    FirebaseFirestore.instance.collection('posts').snapshots().map((snapshot) {
      print(snapshot.docs.first.data());
      print("snapshot 1");
      return snapshot.docs.map((doc) {
        print(doc.data());
        return PostData.fromJson(doc.data());
      }).toList();
    });
