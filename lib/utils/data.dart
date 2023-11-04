import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_estate_major/model/house.dart';

var profile = "https://avatars.githubusercontent.com/u/86506519?v=4";

List<Map> chatsUsers = [
  {
    "id": "1",
    "name": "Rajesh Verma",
    "imageUrl":
        "https://www.shutterstock.com/image-photo/head-shot-young-attractive-businessman-260nw-1854697390.jpg",
  },
  {
    "id": "2",
    "name": "Amit Sinha",
    "imageUrl":
        "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",
  },
  {
    "id": "3",
    "name": "Sonia Gupta",
    "imageUrl":
        "https://media.istockphoto.com/id/1300972573/photo/pleasant-young-indian-woman-freelancer-consult-client-via-video-call.jpg?b=1&s=612x612&w=0&k=20&c=gApYcn6GubvJA-YoMO00KZAShv66MHEwrsAbcmaq_cQ=",
  },
  {
    "id": "4",
    "name": "Ram Agarwal",
    "imageUrl":
        "https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp",
  },
];

List<Map<String, dynamic>> likedProperties = [
  {
    "image":
        "https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Single Villa",
    "price": "\$280k",
    "location": "Phnom Penh, Cambodia",
    "is_favorited": true,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1576941089067-2de3c901e126?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Twin Castle",
    "price": "\$175k",
    "location": "Phnom Penh, Cambodia",
    "is_favorited": true,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1598928506311-c55ded91a20c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Convertible Studio",
    "price": "\$150k",
    "location": "Phnom Penh, Cambodia",
    "is_favorited": true,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1549517045-bc93de075e53?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Twin Villa",
    "price": "\$120k",
    "location": "Phnom Penh, Cambodia",
    "is_favorited": true,
  },
];

mapTOHouseModel(Map house) {
  return House(
    id: house['id'],
    imageBase64: house['imageBase64'],
    location: house['location'],
    description: house['description'],
    price: house['price'],
    sqFeet: house['sqFoot'],
    bedroomCount: house['bedroomCount'],
    ownerId: house['ownerId'],
    totalRoomCount: house['totalRoomCount'],
  );
}

List populars = [
  {
    "image":
        "https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Single Villa",
    "price": "\$280k",
    "location": "Phnom Penh, Cambodia",
    "is_favorited": true,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1598928506311-c55ded91a20c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Convertible Studio",
    "price": "\$150k",
    "location": "Phnom Penh, Cambodia",
    "is_favorited": false,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1576941089067-2de3c901e126?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Twin Castle",
    "price": "\$175k",
    "location": "Phnom Penh, Cambodia",
    "is_favorited": false,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1549517045-bc93de075e53?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Twin Villa",
    "price": "\$120k",
    "location": "Phnom Penh, Cambodia",
    "is_favorited": false,
  },
];

List recommended = [
  {
    "image":
        "https://images.unsplash.com/photo-1592595896616-c37162298647?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Garden House",
    "price": "\$180k",
    "location": "Phnom Penh",
    "is_favorited": true,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1576941089067-2de3c901e126?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Twin Castle",
    "price": "\$175k",
    "location": "Phnom Penh, Cambodia",
    "is_favorited": false,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1625602812206-5ec545ca1231?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "King Villa",
    "price": "\$180k",
    "location": "Phnom Penh, Cambodia",
    "is_favorited": true,
  },
];

List recents = [
  {
    "image":
        "https://images.unsplash.com/photo-1549517045-bc93de075e53?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Double Villa",
    "price": "\$180k",
    "location": "Phnom Penh",
    "is_favorited": false,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1598928506311-c55ded91a20c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Convertible Studio",
    "price": "\$150k",
    "location": "Phnom Penh",
    "is_favorited": false,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1576941089067-2de3c901e126?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Double Villa",
    "price": "\$180k",
    "location": "Phnom Penh",
    "is_favorited": false,
  },
];

List categories = [
  {"name": "All", "icon": FontAwesomeIcons.boxes},
  {"name": "Villa", "icon": FontAwesomeIcons.university},
  {"name": "Shop", "icon": FontAwesomeIcons.storeAlt},
  {"name": "Building", "icon": FontAwesomeIcons.building},
  {"name": "House", "icon": FontAwesomeIcons.home},
];

var brokers = [
  {
    "image":
        "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjV8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "John Siphron",
    "type": "Broker",
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    "rate": 4,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Corey Aminoff",
    "type": "Broker",
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    "rate": 4,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1617069470302-9b5592c80f66?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Z2lybHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Siriya Aminoff",
    "type": "Broker",
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    "rate": 4,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTB8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Rubin Joe",
    "type": "Broker",
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    "rate": 4,
  },
];

List companies = [
  {
    "image":
        "https://images.unsplash.com/photo-1549517045-bc93de075e53?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "TS Home",
    "location": "Phnom Penh, Cambodia",
    "type": "Broker",
    "is_favorited": false,
    "icon": Icons.domain_rounded
  },
  {
    "image":
        "https://images.unsplash.com/photo-1618221469555-7f3ad97540d6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Century 21",
    "location": "Phnom Penh, Cambodia",
    "type": "Broker",
    "is_favorited": true,
    "icon": Icons.house_siding_rounded
  },
  {
    "image":
        "https://images.unsplash.com/photo-1625602812206-5ec545ca1231?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Dabest Pro",
    "location": "Phnom Penh, Cambodia",
    "type": "Broker",
    "is_favorited": true,
    "icon": Icons.home_work_rounded
  },
  {
    "image":
        "https://images.unsplash.com/photo-1625602812206-5ec545ca1231?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Cam Reality",
    "location": "Phnom Penh, Cambodia",
    "type": "Broker",
    "is_favorited": true,
    "icon": Icons.location_city_rounded
  },
];
//
// List<House> recommendedHouses = [
//   House(
//     imageUrl:
//     "https://images.unsplash.com/photo-1592595896616-c37162298647?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//     location: "Phnom Penh, Indore, India",
//     description: "A beautiful house in a great location.",
//     price: 180000.0,
//     bedroomCount: 3,
//     totalRoomCount: 2,
//     sqFeet: 2000.0,
//     garages: 2,
//     time: 2023,
//     isFav: true,
//   ),
//   House(
//     imageUrl:
//     "https://images.unsplash.com/photo-1576941089067-2de3c901e126?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//     location: "Phnom Penh, Cambodia, Indore, India",
//     description: "A charming twin castle with modern amenities.",
//     price: 175000.0,
//     bedroomCount: 2,
//     totalRoomCount: 1,
//     sqFeet: 1200.0,
//     garages: 0,
//     time: 2023,
//     isFav: false,
//   ),
//   House(
//     imageUrl:
//     "https://images.unsplash.com/photo-1625602812206-5ec545ca1231?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//     location: "Phnom Penh, Cambodia, Indore, India",
//     description: "A luxurious king villa with a pool and tennis court.",
//     price: 180000.0,
//     bedroomCount: 4,
//     totalRoomCount: 5,
//     sqFeet: 5000.0,
//     garages: 3,
//     time: 2023,
//     isFav: true,
//   ),
// ];
//
// // Recent Houses
// List<House> recentHouses = [
//   House(
//     imageUrl:
//     "https://images.unsplash.com/photo-1549517045-bc93de075e53?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//     location: "Phnom Penh, Indore, India",
//     description: "A double villa with a beautiful view.",
//     price: 180000.0,
//     bedroomCount: 3,
//     totalRoomCount: 2,
//     sqFeet: 2000.0,
//     garages: 2,
//     time: 2023,
//     isFav: false,
//   ),
//   House(
//     imageUrl:
//     "https://images.unsplash.com/photo-1598928506311-c55ded91a20c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//     location: "Phnom Penh, Indore, India",
//     description: "A convertible studio with a stunning view.",
//     price: 150000.0,
//     bedroomCount: 2,
//     totalRoomCount: 1,
//     sqFeet: 1200.0,
//     garages: 0,
//     time: 2023,
//     isFav: false,
//   ),
//   House(
//     imageUrl:
//     "https://images.unsplash.com/photo-1576941089067-2de3c901e126?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//     location: "Phnom Penh, Indore, India",
//     description: "A double villa for a comfortable living experience.",
//     price: 180000.0,
//     bedroomCount: 3,
//     totalRoomCount: 2,
//     sqFeet: 2000.0,
//     garages: 2,
//     time: 2023,
//     isFav: false,
//   ),
// ];
//
// List<House> popularHouses = [
//   House(
//     imageUrl:
//     "https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//     location: "Phnom Penh, Cambodia, Indore, India",
//     description: "A stylish single villa with a beautiful garden.",
//     price: 280000.0,
//     bedroomCount: 3,
//     totalRoomCount: 2,
//     sqFeet: 2000.0,
//     garages: 2,
//     time: 2023,
//     isFav: true,
//   ),
//   House(
//     imageUrl:
//     "https://images.unsplash.com/photo-1598928506311-c55ded91a20c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//     location: "Phnom Penh, Cambodia, Indore, India",
//     description: "A convertible studio with a stunning view.",
//     price: 150000.0,
//     bedroomCount: 2,
//     totalRoomCount: 1,
//     sqFeet: 1200.0,
//     garages: 0,
//     time: 2023,
//     isFav: false,
//   ),
//   House(
//     imageUrl:
//     "https://images.unsplash.com/photo-1576941089067-2de3c901e126?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//     location: "Phnom Penh, Cambodia, Indore, India",
//     description: "A charming twin castle with modern amenities.",
//     price: 175000.0,
//     bedroomCount: 2,
//     totalRoomCount: 1,
//     sqFeet: 1200.0,
//     garages: 0,
//     time: 2023,
//     isFav: false,
//   ),
//   House(
//     imageUrl:
//     "https://images.unsplash.com/photo-1549517045-bc93de075e53?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
//     location: "Phnom Penh, Cambodia, Indore, India",
//     description: "A cozy twin villa perfect for a family.",
//     price: 120000.0,
//     bedroomCount: 2,
//     totalRoomCount: 1,
//     sqFeet: 1200.0,
//     garages: 0,
//     time: 2023,
//     isFav: false,
//   ),
// ];
