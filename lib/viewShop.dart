import 'package:flutter/material.dart';
import 'package:shrub_hub/Components/Data/nurseryData.dart';
import 'package:shrub_hub/Components/nurseryInfo.dart';

class viewShop extends StatefulWidget {
  const viewShop({Key? key, required this.shopInfo}) : super(key: key);
  final nurseryData shopInfo;
  @override
  State<viewShop> createState() => _viewShopState();
}

class _viewShopState extends State<viewShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.shopInfo.nurseryName,)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            nurseryInfo(nursery: widget.shopInfo, isOnViewShop: true)
          ],
        ),
      ),
    );
  }
}
