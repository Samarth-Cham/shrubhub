import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Post extends StatefulWidget {
  const Post(
      {Key? key,
      required this.imageURL,
      required this.like,
      required this.save})
      : super(key: key);
  final String imageURL;
  final bool like;
  final bool save;
  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Padding(
            child: Container(
              child: Image.network(
                widget.imageURL,
                width: 260,
              ),
              height: 300,
              width: 320,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromRGBO(124, 157, 69, 100), width: 5),
                  borderRadius: BorderRadius.all(Radius.circular(40))),
            ),
            padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
          ),
          Container(
            child: Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.favorite_outline)),
                IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_outline))
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            height: 300,
            width: 320,
            alignment: Alignment.bottomCenter,
          ),
        ],
      ),
    );
  }
}
