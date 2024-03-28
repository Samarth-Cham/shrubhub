import 'package:shrub_hub/Components/Data/PostData.dart';

class user {
  final String name;
  final List<PostData> savedPost;
  final List<PostData> myPost;
  final String imageURL;
  final String city;
  final String phoneNo;
  user({
    required this.city,
    required this.phoneNo,
    required this.savedPost,
    required this.myPost,
    required this.imageURL,
    required this.name,
  });
}

user currentUser = user(
    city: "Gurgaon",
    phoneNo: "9818286163",
    savedPost: postData,
    myPost: postData,
    imageURL: " ",
    name: "samcham123");
