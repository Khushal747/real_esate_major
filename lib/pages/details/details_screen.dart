import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_major/logic.dart';
import 'package:real_estate_major/model/house.dart';
import 'package:real_estate_major/pages/details/components/bottom_buttons.dart';
import 'package:real_estate_major/pages/details/components/carousel_images.dart';
import 'package:real_estate_major/pages/details/components/custom_app_bar.dart';
import 'package:real_estate_major/state_update_provier.dart';

import 'components/house_details.dart';

class DetailsScreen extends StatefulWidget {
  final House house;

  const DetailsScreen({Key? key, required this.house}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    context.watch<StateUpdateProvider>();
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  CarouselImages(widget.house.imageBase64),
                  CustomAppBar(widget.house),
                ],
              ),
              HouseDetails(widget.house),
            ],
          ),
          Logic.user['isSeller'] ? SizedBox() : BottomButtons(widget.house),
        ],
      ),
    );
  }
}
