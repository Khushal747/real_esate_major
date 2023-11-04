import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_major/logic.dart';
import 'package:real_estate_major/model/house.dart';
import 'package:real_estate_major/state_update_provier.dart';
import 'package:real_estate_major/theme/color.dart';
import 'package:real_estate_major/utils/data.dart';
import 'package:real_estate_major/widgets/category_item.dart';
import 'package:real_estate_major/widgets/custom_image.dart';
import 'package:real_estate_major/widgets/custom_textbox.dart';
import 'package:real_estate_major/widgets/icon_box.dart';
import 'package:real_estate_major/widgets/property_item.dart';
import 'package:real_estate_major/widgets/recent_item.dart';
import 'package:real_estate_major/widgets/recommend_item.dart';

class SellerHomePage extends StatefulWidget {
  const SellerHomePage({Key? key}) : super(key: key);

  @override
  _SellerHomePageState createState() => _SellerHomePageState();
}

class _SellerHomePageState extends State<SellerHomePage> {
  @override
  Widget build(BuildContext context) {
    print("BUILD SELLER PAGE");
    context.watch<StateUpdateProvider>();
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: AppColor.appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: _buildHeader(),
        ),
        SliverToBoxAdapter(child: _buildBody())
      ],
    );
  }

  _buildHeader() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Your Properties",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            CustomImage(
              profile,
              width: 35,
              height: 35,
              trBackground: true,
              borderColor: AppColor.primary,
              radius: 10,
            ),
          ],
        ),
      ],
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPopulars()
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: CustomTextBox(
              hint: "Search",
              prefix: Icon(Icons.search, color: Colors.grey),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconBox(
            child: Icon(Icons.filter_list_rounded, color: Colors.white),
            bgColor: AppColor.secondary,
            radius: 10,
          )
        ],
      ),
    );
  }

  int _selectedCategory = 0;

  Widget _buildCategories() {
    List<Widget> lists = List.generate(
      categories.length,
      (index) => CategoryItem(
        data: categories[index],
        selected: index == _selectedCategory,
        onTap: () {
          setState(() {
            _selectedCategory = index;
          });
        },
      ),
    );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  Widget _buildPopulars() {
    print("_buildPopulars");
    List<dynamic> houses = Logic.houses
        .where((map) => map['ownerId'] == Logic.user['id'])
        .toList();
    return Column(
      children: List.generate(
        houses.length,
        (index) {
          House houseModel = mapTOHouseModel(houses[index]);
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: PropertyItem(
              data: houses[index],
              house: houseModel,
            ),
          );
        },
      ),
    );
  }

  // Widget _buildRecommended() {
  //   List<Widget> lists = List.generate(
  //     recommended.length,
  //     (index) => Container(
  //       width: 220,
  //       child: RecommendItem(
  //         data: recommended[index],
  //         house: recommendedHouses[index],
  //       ),
  //     ),
  //   );
  //
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     padding: EdgeInsets.only(bottom: 5, left: 15),
  //     child: Row(children: lists),
  //   );
  // }
  //
  // Widget _buildRecent() {
  //   List<Widget> lists = List.generate(
  //     recents.length,
  //     (index) => RecentItem(
  //       data: recents[index],
  //       house: recentHouses[index],
  //     ),
  //   );
  //
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     padding: EdgeInsets.only(bottom: 5, left: 15),
  //     child: Row(children: lists),
  //   );
  // }
}
