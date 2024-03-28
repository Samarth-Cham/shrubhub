import 'package:flutter/material.dart';
import 'package:shrub_hub/Components/Data/nurseryData.dart';
import 'package:shrub_hub/Components/myButtons.dart';
import 'package:shrub_hub/viewShop.dart';

class nurseryInfo extends StatefulWidget {
  const nurseryInfo({super.key, required this.nursery, required this.isOnViewShop});
  final nurseryData nursery;
  final bool isOnViewShop;
  @override
  State<nurseryInfo> createState() => _nurseryInfoState();
}

class _nurseryInfoState extends State<nurseryInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(124, 157, 69, 1), width: 3),
            borderRadius: BorderRadius.all(Radius.circular(44))
        ),
        height: 108,
        width: 350,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(widget.nursery.imageURL,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 220,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                      child: widget.isOnViewShop? Center(child: Text(widget.nursery.ownerName,style: TextStyle(color: Color.fromRGBO(124, 157, 69, 1), fontWeight: FontWeight.w800),)): Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(widget.nursery.nurseryName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Color.fromRGBO(124, 157, 69, 1)),),
                          SizedBox(
                            width: 30
                          ),
                          customButton(
                              buttonText: "View",
                              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => viewShop(shopInfo: widget.nursery)));},
                              buttonHeight: 35,
                              buttonWidth: 93),
                        ],
                      ),
                    ),
                    Container(
                      height: 2,
                      width: 200,
                      color: Color.fromRGBO(124, 157, 69, 50),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(widget.nursery.phoneNumber,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800,color: Color.fromRGBO(124, 157, 69, 1))),
                        Text(widget.nursery.city, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Color.fromRGBO(124, 157, 69, 1))),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
