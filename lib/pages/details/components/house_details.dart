import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:real_estate_major/constants.dart';
import 'package:real_estate_major/model/house.dart';
import 'package:url_launcher/url_launcher.dart';

class HouseDetails extends StatefulWidget {
  final House house;

  HouseDetails(this.house);

  @override
  _HouseDetailsState createState() => _HouseDetailsState();
}

class _HouseDetailsState extends State<HouseDetails> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: appPadding,
              left: appPadding,
              right: appPadding,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.house.price}',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.house.location,
                        style: TextStyle(
                          fontSize: 15,
                          color: black.withOpacity(0.4),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 15),
                //   child: Text(
                //     '${widget.house.time} hours ago',
                //     style: const TextStyle(
                //       fontSize: 15,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: appPadding, bottom: appPadding),
            child: Text(
              'House information',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: appPadding,
                    bottom: appPadding,
                  ),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: black.withOpacity(0.4),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.house.sqFeet.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Square foot',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: appPadding,
                    bottom: appPadding,
                  ),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: black.withOpacity(0.4),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.house.bedroomCount.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Bedrooms',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: appPadding,
                    bottom: appPadding,
                  ),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: black.withOpacity(0.4),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.house.totalRoomCount.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Bathrooms',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     left: appPadding,
                //     bottom: appPadding,
                //   ),
                //   child: Container(
                //     width: 100,
                //     decoration: BoxDecoration(
                //         color: white,
                //         borderRadius: BorderRadius.circular(20),
                //         border: Border.all(
                //           color: black.withOpacity(0.4),
                //         )),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Text(
                //           widget.house.garages.toString(),
                //           style: const TextStyle(
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //         const SizedBox(
                //           height: 10,
                //         ),
                //         const Text(
                //           'Garages',
                //           style: TextStyle(
                //             fontSize: 15,
                //             fontWeight: FontWeight.w600,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: appPadding,
              right: appPadding,
              bottom: appPadding * 4,
            ),
            child: Text(
              // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed sodales neque. Quisque fermentum interdum elit, in sagittis magna tempus sed. Aenean molestie ante vel tincidunt rhoncus. Aliquam a dictum arcu. Maecenas at libero porta, semper ligula eu, euismod ligula. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec massa metus, dignissim in eros nec, ultricies dignissim lectus. Integer posuere, ex at tincidunt ultrices, est magna vehicula mauris, a dapibus nisi purus nec elit. Pellentesque feugiat urna ac maximus ultricies.\n\nIn hac habitasse platea dictumst. Nunc volutpat libero quis odio consectetur blandit. Etiam non orci at velit commodo condimentum ut at nulla. Vestibulum posuere interdum euismod. Vestibulum fringilla erat sit amet risus fringilla, non tincidunt purus interdum. Maecenas ultrices porttitor libero, nec semper risus imperdiet eget. Aliquam erat volutpat. Maecenas accumsan dapibus porta. Nullam lacinia sed libero sit amet facilisis. Etiam laoreet, lacus a tristique maximus, neque neque tempor nulla, sollicitudin tristique leo orci quis elit. Nam rutrum vel ipsum vel malesuada. Vestibulum bibendum rutrum quam, nec molestie est auctor vel. Vestibulum feugiat accumsan arcu, tempor laoreet ante dictum in. Donec velit tortor, convallis eu ex non, interdum sollicitudin ex. Sed sodales efficitur pharetra. Duis suscipit urna eget lorem molestie auctor.",
              widget.house.description,
              style: TextStyle(
                color: black.withOpacity(0.4),
                height: 1.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
