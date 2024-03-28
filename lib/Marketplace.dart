import 'package:flutter/material.dart';
import 'package:shrub_hub/Components/Data/nurseryData.dart';
import 'package:shrub_hub/Components/nurseryInfo.dart';

class Marketplace extends StatefulWidget {
  const Marketplace({super.key});

  @override
  State<Marketplace> createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: marketplaceData.length,
          itemBuilder: (context, index) {
            return nurseryInfo(nursery: marketplaceData[index], isOnViewShop: false,);
          }),
    );
  }
}
