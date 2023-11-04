import 'package:flutter/material.dart';
import 'package:real_estate_major/constants.dart';
import 'package:real_estate_major/model/house.dart';
import 'package:real_estate_major/pages/chat_page.dart';
import 'package:real_estate_major/util.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomButtons extends StatelessWidget {
  final House house;

  BottomButtons(this.house);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: appPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Util.to(ChatPage(toUserId: house.ownerId));
              // _openMessagesApp("+91 9004323456");
            },
            child: Container(
              width: size.width * 0.4,
              height: 60,
              decoration: BoxDecoration(
                  color: darkBlue,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: darkBlue.withOpacity(0.6),
                        offset: Offset(0, 10),
                        blurRadius: 10)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    (Icons.mail_rounded),
                    color: white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    ' Message',
                    style: TextStyle(
                      color: white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     _launchDialer("+91 9004323456");
          //   },
          //   child: Container(
          //     width: size.width * 0.4,
          //     height: 60,
          //     decoration: BoxDecoration(
          //         color: darkBlue,
          //         borderRadius: BorderRadius.circular(30),
          //         boxShadow: [BoxShadow(
          //             color: darkBlue.withOpacity(0.6),
          //             offset: Offset(0,10),
          //             blurRadius: 10
          //         )]
          //     ),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Icon((Icons.call_rounded),color: white,),
          //         Text(' Call',style: TextStyle(
          //           color: white,
          //           fontSize: 16,
          //           fontWeight: FontWeight.w600,
          //         ),)
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  // Function to open the phone dialer.
  void _launchDialer(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function to open the messages app.
  void _openMessagesApp(String phoneNumber) async {
    final url = 'sms:$phoneNumber?body=';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
