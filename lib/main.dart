import 'package:flutter/material.dart';
import 'package:real_estate_major/config_screen.dart';
import 'package:real_estate_major/front_page.dart';
import 'package:real_estate_major/pages/login_page.dart';
import 'pages/root_buyer.dart';
import 'theme/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Real Estate App',
      theme: ThemeData(
        fontFamily: "Montserrat",
        primaryColor: AppColor.primary,
      ),
      home: ConfigScreen(),
    );
  }
}
