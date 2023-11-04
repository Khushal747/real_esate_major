import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_major/front_page.dart';
import 'package:real_estate_major/logic.dart';
import 'package:real_estate_major/pages/chat_page.dart';
import 'package:real_estate_major/theme/color.dart';
import 'package:real_estate_major/util.dart';
import 'package:real_estate_major/utils/data.dart';
import 'package:real_estate_major/widgets/category_item.dart';
import 'package:real_estate_major/widgets/custom_image.dart';
import 'package:real_estate_major/widgets/custom_textbox.dart';
import 'package:real_estate_major/widgets/icon_box.dart';
import 'package:real_estate_major/widgets/property_item.dart';
import 'package:real_estate_major/widgets/recent_item.dart';
import 'package:real_estate_major/widgets/recommend_item.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
            Text(
              "Settings",
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
        children: [
          // Container(
          //   padding: EdgeInsets.all(11),
          //   margin: EdgeInsets.all(10),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(8),
          //     boxShadow: [
          //       BoxShadow(
          //         color: AppColor.shadowColor.withOpacity(0.1),
          //         spreadRadius: 2,
          //         blurRadius: 4,
          //         offset: Offset(0, 1), // changes position of shadow
          //       ),
          //     ],
          //   ),
          //   child: Column(
          //     children: [
          //       settingItem(
          //         iconData: Icons.person,
          //         iconColor: Colors.orange,
          //         text: "Profile",
          //         onTap: () {},
          //       ),
          //       Container(
          //         height: 1,
          //         margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          //         color: Colors.grey.shade300,
          //       ),
          //       settingItem(
          //         iconData: Icons.notifications,
          //         iconColor: Colors.blue,
          //         text: "Notification",
          //         onTap: () {},
          //       ),
          //       Container(
          //         height: 1,
          //         margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          //         color: Colors.grey.shade300,
          //       ),
          //       settingItem(
          //         iconData: Icons.lock,
          //         iconColor: Colors.green,
          //         text: "Change Password",
          //         onTap: () {},
          //       ),
          //     ],
          //   ),
          // ),
          // Container(
          //   padding: EdgeInsets.all(11),
          //   margin: EdgeInsets.all(10),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(8),
          //     boxShadow: [
          //       BoxShadow(
          //         color: AppColor.shadowColor.withOpacity(0.1),
          //         spreadRadius: 2,
          //         blurRadius: 4,
          //         offset: Offset(0, 1), // changes position of shadow
          //       ),
          //     ],
          //   ),
          //   child: Column(
          //     children: [
          //       settingItem(
          //         iconData: Icons.sunny,
          //         iconColor: Colors.yellow,
          //         text: "App Mode",
          //         onTap: () {},
          //       ),
          //       Container(
          //         height: 1,
          //         margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          //         color: Colors.grey.shade300,
          //       ),
          //       settingItem(
          //         iconData: Icons.favorite,
          //         iconColor: Colors.red,
          //         text: "Favorites",
          //         onTap: () {},
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            padding: EdgeInsets.all(11),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: AppColor.shadowColor.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                settingItem(
                  iconData: Icons.logout_rounded,
                  iconColor: Colors.red,
                  text: "Logout",
                  onTap: () {
                    Logic.logoutUser();
                    Util.offAll(FrontPage());
                  },
                ),
              ],
            ),
          ),
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

  // Widget _buildPopulars() {
  //   return Column(
  //     children: List.generate(
  //       likedHouses.length,
  //       (index) => Container(
  //         margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //         child: settingItem(chatsUsers[index]),
  //       ),
  //     ),
  //   );
  // }

  Widget settingItem({
    required IconData iconData,
    required Color iconColor,
    required String text,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            height: 35,
            width: 35,
            margin: EdgeInsets.only(left: 5, right: 15),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              iconData,
              color: iconColor,
              size: 25,
            ),
          ),
          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.grey,
            size: 20,
          )
        ],
      ),
    );
  }
}
