import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:developer' as dev;
import 'dart:convert';

import 'package:image_picker/image_picker.dart';
import 'package:real_estate_major/logic.dart';
import 'package:real_estate_major/theme/color.dart';
import 'package:real_estate_major/util.dart';
import 'package:real_estate_major/utils/data.dart';
import 'package:real_estate_major/widgets/custom_image.dart';

class HouseForm extends StatefulWidget {
  @override
  _HouseFormState createState() => _HouseFormState();
}

class _HouseFormState extends State<HouseForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController sqFootController = TextEditingController();
  TextEditingController bedroomCountController = TextEditingController();
  TextEditingController totalRoomCountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  XFile? imageFile;

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = image;
    });
  }

  void clearForm() {
    nameController.clear();
    priceController.clear();
    locationController.clear();
    sqFootController.clear();
    bedroomCountController.clear();
    totalRoomCountController.clear();
    descriptionController.clear();
    imageFile = null;
  }

  void addHouse() async {
    if (_formKey.currentState!.validate() && imageFile != null) {
      // Convert image to base64
      Uint8List imageBytes = await imageFile!.readAsBytes();
      String base64Image = base64Encode(imageBytes);

      dev.log(base64Image);
      Map<String, dynamic> houseData = {
        "id": Random().nextInt(9999999).toString(),
        "name": nameController.text,
        "price": "₹ ${priceController.text}",
        "location": locationController.text,
        "sqFoot": sqFootController.text,
        "bedroomCount": bedroomCountController.text,
        "totalRoomCount": totalRoomCountController.text,
        "description": descriptionController.text,
        "ownerId": Logic.user['id'],
        "imageBase64": base64Image,
      };

      dev.log("House data: $houseData");
      clearForm();
      await Logic.addHouse(houseData);
      Util.getSnackBar(
        "Property Added",
        icon: Icons.check_circle_outline,
        color: Colors.green,
      );
    } else {
      if (imageFile == null) {
        // Show a dialog or error message that an image needs to be selected.
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Please select an image."),
              actions: <Widget>[
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  _buildHeader() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Add Properties",
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

  _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the name';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(
                labelText: 'Price',
                prefixText: '₹ ',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the price';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'Location',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the location';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: sqFootController,
              decoration: InputDecoration(
                labelText: 'House square foot',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the square foot';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: bedroomCountController,
              decoration: InputDecoration(
                labelText: 'Bedroom count',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the bedroom count';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: totalRoomCountController,
              decoration: InputDecoration(
                labelText: 'Total rooms',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the total rooms';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              maxLines: null,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                getImage(); // Call the method to pick an image
              },
              child: Text('Select Image'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  addHouse();
                }
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 90)
          ],
        ),
      ),
    );
  }
}
