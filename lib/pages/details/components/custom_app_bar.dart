import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_major/constants.dart';
import 'package:real_estate_major/logic.dart';
import 'package:real_estate_major/model/house.dart';

class CustomAppBar extends StatelessWidget {
  final House house;

  CustomAppBar(this.house);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("Logic.likedHouses ${Logic.likedHouses}");

    return Padding(
      padding: const EdgeInsets.only(
        left: appPadding,
        right: appPadding,
        top: appPadding,
      ),
      child: Container(
        height: size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: white.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(15)),
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: white,
                ),
              ),
            ),
            Logic.user['isSeller']
                ? GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title:
                                Text('Are you sure to delete this property?'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Dismiss the dialog
                                },
                              ),
                              TextButton(
                                child: Text('OK'),
                                onPressed: () async {
                                  await Logic.removeHouse(house.id);
                                  Navigator.of(context)
                                      .pop(); // Dismiss the dialog
                                  Get.back();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: red.withOpacity(0.4)),
                          borderRadius: BorderRadius.circular(15)),
                      child: Icon(
                        Icons.delete_forever_outlined,
                        color: red,
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      Logic.addRemoveLiked(house.id);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: white.withOpacity(0.4)),
                          borderRadius: BorderRadius.circular(15)),
                      child: Icon(
                        Logic.likedHouses.any((map) => map['id'] == house.id)
                            ? Icons.favorite
                            : Icons.favorite_border_rounded,
                        color: Logic.likedHouses
                                .any((map) => map['id'] == house.id)
                            ? red
                            : white,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
