import 'package:flutter/material.dart';
import 'package:shrub_hub/Components/postWidget.dart';

class PostWithCaption extends StatefulWidget {
  const PostWithCaption(
      {Key? key,
      required this.imageURL,
      required this.like,
      required this.save,
      required this.caption,
      required this.TagList})
      : super(key: key);
  final String imageURL;
  final bool like;
  final bool save;
  final String caption;
  final List<String> TagList;
  @override
  State<PostWithCaption> createState() => _PostWithCaptionState();
}

class _PostWithCaptionState extends State<PostWithCaption> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Post(imageURL: widget.imageURL, like: widget.like, save: widget.save),
        Container(
          child: Row(
            children: [
              Text(
                  textAlign: TextAlign.center,
                  widget.caption,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  )),
              TextButton(
                  onPressed: () {},
                  child: Text(
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      widget.TagList[0]))
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          width: 316,
          height: 46,
          decoration: ShapeDecoration(
            color: Color(0xFF7C9D45),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 3, color: Color(0xFFFFFDFD)),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        )
      ],
    );
  }
}
