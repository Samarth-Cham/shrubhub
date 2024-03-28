import 'package:flutter/material.dart';
import 'package:shrub_hub/Components/PostWithCaption.dart';
import 'package:shrub_hub/addPost.dart';
import 'package:shrub_hub/postPage.dart';
import 'Components/Data/PostData.dart';
import 'firebaseAuthFunctions.dart';

// class DrawerWidget extends StatelessWidget {
//   const DrawerWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: [
//           ListTile(
//             title: Text('Public Forum'),
//             onTap: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                     builder: (BuildContext context) => Nav2()),
//               );
//             },
//           ),
//           ListTile(
//             title: Text('Nurseries'),
//             onTap: () {
//               Navigator.pushReplacementNamed(context, '/nurseries');
//             },
//           ),
//           ListTile(
//             title: Text('My Account'),
//             onTap: () {
//               Navigator.pushReplacementNamed(context, '/my_account');
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class Nav2 extends StatelessWidget {
//   // final listDataNav;
//
//   void auth(){
//     FirebaseAuth.instance
//         .authStateChanges()
//         .listen((User? user) {
//       if (user != null) {
//         print("Forum Page  "+ user.uid);
//         final sample = <String, String>{
//           "name": "Los Angeles",
//           "state": "CA",
//           "country": "USA"
//         };
//
//         FirebaseFirestore.instance
//             .collection("users")
//             .doc(user.uid)
//             .set(sample)
//             .onError((e, _) => print("Error writing document: $e"));
//
//       }
//     });
//   }
//
//
//
//   Nav2({
//   super.key
// });
//
//   @override
//   Widget build(BuildContext context) {
//     auth();
//     return Scaffold(
//         appBar: AppBar(
//             title: Center(
//       child: Text("Forum"),
//     )));
//   }
// }

class Forum extends StatefulWidget {
  const Forum({Key? key}) : super(key: key);

  @override
  State<Forum> createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StreamBuilder<List<PostData>>(
            stream: readPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot);
                print(snapshot.error);
                return Text("Something went wrong");
              } else if (snapshot.hasData) {
                final postData = snapshot.data;

                // return ListView(
                //   children: posts?.map(buildUser).toList() ??
                //   [Text("Something went wrong in list")],
                // );

                return ListView.builder(
                  itemCount: postData?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        print(index);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    postPage(postWithData: postData![index])));
                      },
                      child: PostWithCaption(
                          imageURL: postData![index].ImageURL,
                          like: postData![index].isLiked,
                          save: postData![index].isBookmarked,
                          caption: postData![index].caption,
                          TagList: postData[index].TagList),
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => addPost()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
