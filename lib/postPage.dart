import 'package:flutter/material.dart';
import 'package:shrub_hub/Components/myTextField.dart';
import 'package:shrub_hub/Components/postWidget.dart';

import 'Components/Data/PostData.dart';

class postPage extends StatefulWidget {
  const postPage({super.key, required this.postWithData});
  final PostData postWithData;
  @override
  State<postPage> createState() => _postPageState();
}

class _postPageState extends State<postPage> {
  TextEditingController comments = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(widget.postWithData.comments);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.postWithData.caption),
      ),
      body: Column(
        children: [
          Post(
              imageURL: widget.postWithData.ImageURL,
              like: widget.postWithData.isLiked,
              save: widget.postWithData.isBookmarked),
          Container(
            child: Center(child: Text(widget.postWithData.description)),
          ),
          // Container(
          //   child: ListView.builder(
          //     itemCount: widget.postWithData.comments.length,
          //     itemBuilder: (context, index) {
          //       return Container(
          //         child: Text(widget.postWithData.comments[index]),
          //       );
          //     },
          //   ),
          // ),
          Row(
            children: [
              Container(
                color: Color.fromRGBO(124, 157, 69, 50),
                width: MediaQuery.of(context).size.width * 0.8,
                alignment: Alignment.center,
                child: MyTextField(
                  showIcon: false,
                  controller: comments,
                  iconData: Icons.send,
                  hintText: "Write Comments Here",
                  width: (MediaQuery.of(context).size.width * 0.8).round(),
                ),
              ),
              IconButton(
                  onPressed: () {
                    print((MediaQuery.of(context).size.width * 0.8).round());
                    },
                  icon: Icon(Icons.send)),
            ],
          )
        ],
      ),
    );
  }
}
