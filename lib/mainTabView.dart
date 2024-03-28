import 'package:flutter/material.dart';
import 'package:shrub_hub/Marketplace.dart';
import 'package:shrub_hub/forum.dart';
import 'package:shrub_hub/myProfile.dart';

import 'SignUp.dart';

class tabView extends StatefulWidget {
  const tabView({Key? key}) : super(key: key);

  @override
  State<tabView> createState() => _tabViewState();
}

class _tabViewState extends State<tabView> {
  List<Widget> widgetList = [Forum(), Marketplace()];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widgetList.length,
        child: Scaffold(
          appBar: AppBar(
            bottom:
                TabBar(tabs: [Tab(text: "Forum"), Tab(text: "Marketplace")]),
            title: Center(child: Text("Shrub Hub")),
            actions: [
              InkWell(
                child: CircleAvatar(
                  child: IconButton(onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) =>  myProfile()))}, icon: Icon(Icons.person)),
                ),
                onTap: () {},
              )
            ],
          ),
          body: TabBarView(children: widgetList),
        ));
  }
}
