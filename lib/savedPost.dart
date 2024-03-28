import 'package:flutter/material.dart';
import 'package:shrub_hub/Components/Data/PostData.dart';
import 'package:shrub_hub/Components/PostWithCaption.dart';

class PersonalPosts extends StatefulWidget {
  const PersonalPosts(
      {super.key, required this.savedPosts, required this.isSavedPost});
  final List<PostData> savedPosts;
  final bool isSavedPost;
  @override
  State<PersonalPosts> createState() => _PersonalPostsState();
}

class _PersonalPostsState extends State<PersonalPosts> {
  @override
  Widget build(BuildContext context) {
    print(widget.savedPosts.length);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isSavedPost ? "Saved Posts" : "My Posts"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: widget.savedPosts.length,
          itemBuilder: (context, index) {
            return PostWithCaption(
                imageURL: widget.savedPosts[index].ImageURL,
                like: widget.savedPosts[index].isLiked,
                save: widget.savedPosts[index].isBookmarked,
                caption: widget.savedPosts[index].caption,
                TagList: widget.savedPosts[index].TagList);
          },
        ),
      ),
    );
  }
}
