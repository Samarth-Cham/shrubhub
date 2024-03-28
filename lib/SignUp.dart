import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shrub_hub/Components/myButtons.dart';
import 'package:shrub_hub/Components/myTextField.dart';
import 'package:shrub_hub/Components/postWidget.dart';
import 'package:shrub_hub/Login.dart';
import 'package:shrub_hub/mainTabView.dart';

import 'firebaseAuthFunctions.dart';
import 'forum.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            " Shrub Hub",
            style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 26),
          )),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
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
            const Center(
              child: SizedBox(
                width: 400,
                height: 500,
                child: WelcomeForm(),
              ),
            ),
          ],
        ));
  }
}

class WelcomeForm extends StatefulWidget {
  const WelcomeForm({super.key});

  @override
  State<WelcomeForm> createState() => _WelcomeFormState();
}

class _WelcomeFormState extends State<WelcomeForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var data;
  final arrName = [];
  final arrEmail = [];
  final arrPass = [];

  // Map<String, dynamic>? get data => null;
  static Future<String?> mailRegister(String mail, String pwd) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: mail, password: pwd);
      FirebaseAuth.instance.authStateChanges().listen((user) {
        print(user);
      });
      return null;
    } on FirebaseAuthException catch (ex) {
      return "${ex.code}: ${ex.message}";
    }
  }

  static Future<String?> mailSignIn(String mail, String pwd) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail, password: pwd);
      FirebaseAuth.instance.authStateChanges().listen((user) {
        // debugPrint(user.toString());
      });
      return null;
    } on FirebaseAuthException catch (ex) {
      return "${ex.code}: ${ex.message}";
    }
  }

  static Future<void> mailLogout(String mail) async {
    await FirebaseAuth.instance.signOut();
    print("Logged Out");
  }

  static Future<void> resetPassword(String mail) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: mail);
    print("Reset mail sent to $mail, do check spam");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            textBaseline: TextBaseline.ideographic,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Padding(
              padding: EdgeInsets.only(top: 20, bottom: 30),
              child: Text(
                "Welcome Form",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              )),
          Form(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: TextFormField(
                  cursorColor: Colors.white70,
                  style: const TextStyle(color: Colors.white70),
                  controller: nameController,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        borderSide: BorderSide(
                          color: Colors.white70,
                        ),
                      ),
                      // focusedBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.only(
                      //       topRight: Radius.circular(20),
                      //       bottomLeft: Radius.circular(20)),
                      //   borderSide: BorderSide(
                      //     color: Colors.white70,
                      //   ),
                      // ),
                      label: Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      hintText: 'Name',
                      hintStyle: TextStyle(color: Colors.white70),
                      suffixIcon: Icon(
                        Icons.person,
                        color: Colors.white70,
                      )),
                )),
          ),
          Form(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: TextFormField(
                  cursorColor: Colors.white70,
                  style: const TextStyle(color: Colors.white70),
                  controller: emailController,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        borderSide: BorderSide(
                          color: Colors.white70,
                        ),
                      ),
                      // focusedBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.only(
                      //       topRight: Radius.circular(20),
                      //       bottomLeft: Radius.circular(20)),
                      //   borderSide: BorderSide(
                      //     color: Colors.white70,
                      //   ),
                      // ),
                      label: Text(
                        'Email',
                        style: TextStyle(color: Colors.white70),
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white70),
                      suffixIcon: Icon(
                        Icons.email,
                        color: Colors.white70,
                      )),
                )),
          ),
          Form(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: TextFormField(
                  cursorColor: Colors.white70,
                  style: const TextStyle(color: Colors.white70),
                  controller: passwordController,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        borderSide: BorderSide(
                          color: Colors.white70,
                        ),
                      ),
                      // focusedBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.only(
                      //       topRight: Radius.circular(20),
                      //       bottomLeft: Radius.circular(20)),
                      //   borderSide: BorderSide(
                      //     color: Colors.white70,
                      //   ),
                      // ),
                      label: Text(
                        'Password',
                        style: TextStyle(color: Colors.white70),
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white70),
                      suffixIcon: Icon(
                        Icons.email,
                        color: Colors.white70,
                      )),
                )),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                // child: SizedBox(
                //   width: 100,
                //   height: 40,
                //   child: atedButton(
                //     onPressed: () {
                //       final listDataElev = <String, dynamic>{
                //         "name": nameController.text,
                //         "email": emailController.text,
                //         "password": passwordController.text
                //       };
                //       db
                //           .collection("users")
                //           .add(listData)
                //           .then((value) => debugPrint(value.id));
                //       // data added, now fetching
                //
                //       db.collection("users").get().then(
                //         (querySnapshot) {
                //           print("Successfully fetched");
                //           for (var docSnapshot in querySnapshot.docs) {
                //             final docRef = db
                //                 .collection("users")
                //                 .doc(docSnapshot.id);
                //             // print('${docSnapshot.id} => ${docSnapshot.data()}');
                //             docRef.get().then(
                //               (DocumentSnapshot doc) {
                //                 data = doc.data() as Map<String, dynamic>;
                //                 print(data);
                //                 Navigator.of(context).push(
                //                   MaterialPageRoute(
                //                       builder: (context) =>
                //                           Nav2(link1data: data)),
                //                 );
                //               },
                //               onError: (e) =>
                //                   print("Error getting document: $e"),
                //             );
                //           }
                //           ;
                //           // print(arrName + arrEmail + arrPass);
                //         },
                //         onError: (e) => print("Error completing: $e"),
                //       );
                //     },
                //     child: Icon(Icons.arrow_forward),
                //   ),
                // )
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // FloatingActionButton(
                //   heroTag: 'hero1',
                //   backgroundColor: const Color.fromRGBO(124, 157, 69, 50),
                //   tooltip: 'Register',
                //   onPressed: () =>
                //   {
                //     mailRegister(
                //         emailController.text, passwordController.text),
                //     FirebaseAuth.instance
                //         .authStateChanges()
                //         .listen((User? user) {
                //       if (user == null) {
                //         print('User is not registered!');
                //       } else {
                //         print('User is registered!${user.uid}');
                //         Navigator.of(context).push(
                //           MaterialPageRoute(
                //               builder: (context) => Nav2()),
                //         );
                //       }
                //     })
                //   },
                //   child: const Icon(Icons.app_registration_rounded),
                // ),
                // FloatingActionButton(
                //   heroTag: 'hero2',
                //   backgroundColor: const Color.fromRGBO(124, 157, 69, 50),
                //   tooltip: 'Sign In',
                //   onPressed: () =>
                //   {
                //     mailSignIn(
                //         emailController.text, passwordController.text),
                //     // mailSignIn('pandeybhaskar587@gmail.com', 'pandey123'),
                //     FirebaseAuth.instance
                //         .authStateChanges()
                //         .listen((User? user) {
                //       if (user == null) {
                //         print('User is currently signed out!');
                //       } else {
                //         print(
                //           'User is signed in!',
                //         );
                //         Navigator.of(context).push(MaterialPageRoute(
                //             builder: (context) => Nav2()));
                //       }
                //     })
                //   },
                //   child: const Icon(Icons.login_rounded),
                // ),
                customButton(
                    buttonText: "Register",
                    onTap: () => {
                      AuthCredentials(emailController.text, passwordController.text, context)
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => tabView()))
                        },
                    buttonHeight: 68,
                    buttonWidth: 118),
                customButton(
                    buttonText: "Log In",
                    onTap: () => {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => lognIn()))
                        },
                    buttonHeight: 68,
                    buttonWidth: 118),

                // FloatingActionButton(
                //   heroTag: 'hero4',
                //   backgroundColor: const Color.fromRGBO(124, 157, 69, 50),
                //   tooltip: 'Forgot Password',
                //   onPressed: () => {resetPassword(emailController.text)},
                //   child: const Icon(Icons.lock_reset_rounded),
                // )
              ],
            ),
          )
        ]));
  }
}
