import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:real_estate_major/theme/color.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
    this.name, {
    this.width = 100,
    this.height = 100,
    this.bgColor,
    this.borderWidth = 0,
    this.borderColor,
    this.trBackground = false,
    this.isNetwork = true,
    this.radius = 50,
  });

  final String name;
  final double width;
  final double height;
  final double borderWidth;
  final Color? borderColor;
  final Color? bgColor;
  final bool trBackground;
  final bool isNetwork;
  final double radius;

  @override
  Widget build(BuildContext context) {
    late ImageProvider<Object> imageProvider;
    if (isNetwork) {
      imageProvider = NetworkImage(name);
    } else {
      imageProvider = MemoryImage(base64Decode(name));
    }
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
