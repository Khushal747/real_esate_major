import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_major/pages/login_page.dart';
import 'package:real_estate_major/util.dart';
import 'package:real_estate_major/widgets/custom_button.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blue.shade100,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Image.asset("assets/images/login_logo.png", height: 110),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              "ECORP",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
              ),
            ),
          ),
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              CustomButton(
                text: "Seller Login",
                onPressed: () {
                  Util.to(LoginScreen(isSeller: true));
                },
              ),
              Spacer(),
              CustomButton(
                text: "Buyer Login",
                onPressed: () {
                  Util.to(LoginScreen(isSeller: false));
                },
              ),
              Spacer(),
            ],
          ),
          Spacer(),
          // ElevatedButton(
          //   onPressed: () {},
          //   child: Text("Seller"),
          //   style: ButtonStyle(
          //     backgroundColor: Colors.yellow,
          //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //           RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(18.0),
          //               side: BorderSide(color: Colors.red)))),
          // ),
          // ElevatedButton(
          //   onPressed: () {},
          //   child: Text("Buyer"),
          //   style: ButtonStyle(
          //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //           RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(18.0),
          //               side: BorderSide(color: Colors.red)))),
          // ),
        ],
      ),
    );
  }
}
