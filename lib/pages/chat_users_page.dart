import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class ChatUsersPage extends StatefulWidget {
  const ChatUsersPage({Key? key}) : super(key: key);

  @override
  _ChatUsersPageState createState() => _ChatUsersPageState();
}

class _ChatUsersPageState extends State<ChatUsersPage> {
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
              "Chats",
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
      child: _buildPopulars(),
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
    // return SizedBox();
    return Column(
      children: List.generate(
        Logic.userChats.length,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: chatItem(Logic.userChats[index]),
        ),
      ),
    );
  }

  Widget chatItem(var chat) {
    String buyerId = chat.toString().split('-')[1];
    String sellerId = chat.toString().split('-')[2];

    var otherUser = Logic.users.firstWhereOrNull((element) =>
        (element['id'] == (Logic.user['isSeller'] ? buyerId : sellerId)));

    // if(otherUser==null) return SizedBox();
    return GestureDetector(
      onTap: () {
        Util.to(ChatPage(
          toUserId: Logic.user['isSeller'] ? buyerId : sellerId,
        ));
      },
      child: Container(
        padding: EdgeInsets.all(11),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.04),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: 50,
              width: 50,
              margin: EdgeInsets.only(left: 5, right: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/pfp.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    otherUser["name"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 2),
                  //   child: Text(
                  //     "Lorem ipsum dolor sit amet",
                  //     maxLines: 1,
                  //     overflow: TextOverflow.ellipsis,
                  //     style: TextStyle(
                  //       fontSize: 12,
                  //       color: Colors.black,
                  //       fontWeight: FontWeight.w400,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
