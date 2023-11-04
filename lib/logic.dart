import 'dart:math';
import 'dart:developer' as dev;

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_major/state_update_provier.dart';

String houseSP = "houseSP";
String usersSP = "usersSP";
String currentUserSP = "currentUserSP";
String likedIdsSp = "likedIdsSp";
String chatsSp = "chatsSp";

class Logic {
  static List<dynamic> get houses => getHouses();

  static List<dynamic> get likedHouses => getLikedHouses();

  static List<dynamic> get users => getUsers();

  static dynamic get user => getCurrentUser();

  static dynamic get allChats => getChats();

  static dynamic get userChats => getUserChats();

  static getHouses() {
    List<dynamic> houses = GetStorage().read(houseSP) ?? [];
    return houses;
  }

  static getChats() {
    List<dynamic> chats = GetStorage().read(chatsSp) ?? [];
    return chats;
  }

  static getUserChats() {
    List<dynamic> chats = GetStorage().read(chatsSp) ?? [];
    List<dynamic> userChats = chats.where((str) => str.contains(user['id'])).toList();

    return userChats;
  }

  static getLikedHouses() {
    List<dynamic> houses = GetStorage().read(houseSP) ?? [];
    List<dynamic> likedIds = GetStorage().read(likedIdsSp) ?? [];

    List<dynamic> likedHouses = houses
        .where((house) => likedIds.contains(house['id']))
        .toList();
    return likedHouses;
  }

  static addHouse(Map<String, dynamic> house) async {
    List<dynamic> houses = GetStorage().read(houseSP) ?? [];
    // houses = [];
    houses.add(house);
    await GetStorage().write(houseSP, houses);
    updateState();
  }

  static getUsers() {
    List<dynamic> users = GetStorage().read(usersSP) ?? [];
    return users;
  }

  static addUser(Map<String, dynamic> user) async {
    List<dynamic> users = GetStorage().read(usersSP) ?? [];
    users.add(user);
    await GetStorage().write(usersSP, users);
    updateState();
  }

  static updateState() {
    Provider.of<StateUpdateProvider>(Get.context!, listen: false).updateState();
    print("State Updated");
  }

  static Future<void> loginUser(Map<String, dynamic> user) async {
    await GetStorage().write(currentUserSP, user);
    updateState();
  }

  static Future<void> logoutUser() async {
    await GetStorage().write(currentUserSP, null);
    updateState();
  }

  static getCurrentUser() {
    var user = GetStorage().read(currentUserSP);
    return user;
  }

  static Future<void> removeHouse(String id) async {
    List<dynamic> houses = GetStorage().read(houseSP) ?? [];
    houses.removeWhere((map) => map['id'] == id);
    await GetStorage().write(houseSP, houses);
    updateState();
  }

  static Future<void> addData(String id) async {
    List<dynamic> houses = GetStorage().read(houseSP) ?? [];
    var house = houses[0];
    for (int i = 0; i < 10; i++) {
      var id = Random().nextInt(9999999).toString();
      Map newMap = {...house};
      newMap['id'] = id;
      houses.add(newMap);
    }
    await GetStorage().write(houseSP, houses);
    updateState();
  }

  static Future<void> addRemoveLiked(String id) async {
    List<dynamic> likedIds = GetStorage().read(likedIdsSp) ?? [];
    print("addRemoveLiked");
    print(likedIds);
    print(id);
    if(!likedIds.contains(id)) {
      likedIds.add(id);
    } else {
      likedIds.remove(id);
    }
    print(likedIds);
    await GetStorage().write(likedIdsSp, likedIds);
    updateState();
  }

  static Future<void> addChat(String s) async {
    List<dynamic> chats = GetStorage().read(chatsSp) ?? [];
    if(chats.contains(s)) {
      return;
    }
    chats.add(s);
    await GetStorage().write(chatsSp, chats);
    updateState();
  }
}
