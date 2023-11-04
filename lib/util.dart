import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_major/provider_page.dart';

class Util {
  static void to(Widget page) {
    Get.to(() => ProviderPage(child: page), preventDuplicates: false);
  }

  static void offAll(Widget page) {
    Get.offAll(() => ProviderPage(child: page));
  }

  static getSnackBar(String text,
      {var icon, color, int duration = 3, int delayMilli = 0}) async {
    if (!Get.isSnackbarOpen) {
      await Future.delayed(Duration(milliseconds: delayMilli));
      Get.showSnackbar(
        GetSnackBar(
          messageText: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(icon ?? Icons.info_outline,
                      color: Colors.white, size: 25)),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ],
          ),
          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          borderRadius: 13,
          backgroundColor: color ?? const Color.fromRGBO(238, 82, 95, 1),
          duration: Duration(seconds: duration),
        ),
      );
    }
  }
}
