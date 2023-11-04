import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_major/logic.dart';
import 'package:real_estate_major/model/house.dart';
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
  List<dynamic> _searchedHouses = Logic.houses;

  @override
  Widget build(BuildContext context) {
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello!",
                  style: TextStyle(
                    color: AppColor.darker,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  Logic.user['name'],
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
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
          const SizedBox(
            height: 15,
          ),
          _buildSearch(),
          // const SizedBox(
          //   height: 20,
          // ),
          // _buildCategories(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Properties",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "See all",
                //   style: TextStyle(fontSize: 14, color: AppColor.darker),
                // ),
              ],
            ),
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          _buildPopulars(),
          // const SizedBox(
          //   height: 20,
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 15),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         "Recommended",
          //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          //       ),
          //       Text(
          //         "See all",
          //         style: TextStyle(fontSize: 14, color: AppColor.darker),
          //       ),
          //     ],
          //   ),
          // ),
          // // const SizedBox(
          // //   height: 20,
          // // ),
          // // _buildRecommended(),
          // const SizedBox(
          //   height: 20,
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 15),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         "Recent",
          //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          //       ),
          //       Text(
          //         "See all",
          //         style: TextStyle(fontSize: 14, color: AppColor.darker),
          //       ),
          //     ],
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // _buildRecent(),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget _buildPopulars() {
    print("_buildPopulars");
    return Column(
      children: List.generate(
        _searchedHouses.length,
        (index) {
          House houseModel = mapTOHouseModel(_searchedHouses[index]);
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: PropertyItem(
              data: _searchedHouses[index],
              house: houseModel,
            ),
          );
        },
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
              onChange: (s) {
                search(s);
              },
            ),
          ),
          // const SizedBox(
          //   width: 10,
          // ),
          // IconBox(
          //   child: Icon(Icons.filter_list_rounded, color: Colors.white),
          //   bgColor: AppColor.secondary,
          //   radius: 10,
          // )
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

  void search(String s) {
    s = s.toLowerCase();
    List<dynamic> filteredMaps = Logic.houses
        .where((map) =>
            (map['name'].toString().toLowerCase().contains(s)) ||
            (map['location'].toString().toLowerCase().contains(s)))
        .toList();
    setState(() {
      _searchedHouses = filteredMaps;
    });
  }

// Widget _buildPopulars() {
//   return CarouselSlider(
//     options: CarouselOptions(
//       height: 240,
//       enlargeCenterPage: true,
//       disableCenter: true,
//       viewportFraction: .8,
//     ),
//     items: List.generate(
//       populars.length,
//       (index) => PropertyItem(
//         data: populars[index],
//         house: popularHouses[index],
//       ),
//     ),
//   );
// }
//
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
