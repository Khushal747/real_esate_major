import 'dart:convert';

import 'package:flutter/material.dart';

class CarouselImages extends StatefulWidget {
  final String imageUrl;

  CarouselImages(this.imageUrl);

  @override
  _CarouselImagesState createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          height: size.height * 0.35,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: MemoryImage(base64Decode(widget.imageUrl)),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: size.height * 0.35,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ],
    );

  }
}
