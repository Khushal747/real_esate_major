import 'package:flutter/material.dart';
import 'package:real_estate_major/pages/chat_page.dart';
import 'package:real_estate_major/pages/explore.dart';
import 'package:real_estate_major/pages/likes_screen.dart';
import 'package:real_estate_major/pages/settings_page.dart';
import 'package:real_estate_major/provider_page.dart';
import 'package:real_estate_major/theme/color.dart';
import 'package:real_estate_major/widgets/bottombar_item.dart';

import 'chat_users_page.dart';
import 'buyer_home.dart';

class RootAppBuyer extends StatefulWidget {
  const RootAppBuyer({Key? key}) : super(key: key);

  @override
  _RootAppBuyerState createState() => _RootAppBuyerState();
}

class _RootAppBuyerState extends State<RootAppBuyer> {
  int _activeTab = 0;
  final List _barItems = [
    {
      "icon": Icons.home_outlined,
      "active_icon": Icons.home_rounded,
      "page": SellerHomePage(),
    },
    // {
    //   "icon": Icons.search_outlined,
    //   "active_icon": Icons.search,
    //   "page": ExplorePage(),
    // },
    {
      "icon": Icons.favorite_border,
      "active_icon": Icons.favorite_outlined,
      "page": LikesScreen(),
    },
    {
      "icon": Icons.forum_outlined,
      "active_icon": Icons.forum_rounded,
      "page": ChatUsersPage(),
    },
    {
      "icon": Icons.settings_outlined,
      "active_icon": Icons.settings_rounded,
      "page": SettingsPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: _buildPage(),
      floatingActionButton: _buildBottomBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget _buildPage() {
    return ProviderPage(child: _barItems[_activeTab]["page"]);
    return IndexedStack(
      index: _activeTab,
      children: List.generate(
        _barItems.length,
        (index) => _barItems[index]["page"],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 55,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: AppColor.bottomBarColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(
          _barItems.length,
          (index) => BottomBarItem(
            _activeTab == index
                ? _barItems[index]["active_icon"]
                : _barItems[index]["icon"],
            isActive: _activeTab == index,
            activeColor: AppColor.primary,
            onTap: () {
              setState(() {
                _activeTab = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
