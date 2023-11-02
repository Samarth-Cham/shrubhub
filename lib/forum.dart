import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';


class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('Public Forum'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Nav2()),
              );
            },
          ),
          ListTile(
            title: Text('Nurseries'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/nurseries');
            },
          ),
          ListTile(
            title: Text('My Account'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/my_account');
            },
          ),
        ],
      ),
    );
  }
}


class Nav2 extends StatelessWidget {
  // final listDataNav;

  void auth(){
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user != null) {
        print("Forum Page  "+ user.uid);
        final sample = <String, String>{
          "name": "Los Angeles",
          "state": "CA",
          "country": "USA"
        };

        FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .set(sample)
            .onError((e, _) => print("Error writing document: $e"));

      }
    });
  }



  Nav2({
  super.key
});

  @override
  Widget build(BuildContext context) {
    auth();
    return Scaffold(
        appBar: AppBar(
            title: Center(
      child: Text("Forum"),
    )));
  }
}


