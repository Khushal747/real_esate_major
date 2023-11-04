import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:real_estate_major/logic.dart';
import 'package:real_estate_major/pages/root_seller.dart';
import 'package:real_estate_major/pages/root_buyer.dart';
import 'package:real_estate_major/util.dart';
import 'dart:math';

class LoginScreen extends StatelessWidget {
  bool isSeller;

  LoginScreen({super.key, required this.isSeller});

  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    print(Logic.users);
    return Future.delayed(loginTime).then((_) async {
      for (var user in Logic.users) {
        print("CHECK ${user['isSeller'] == isSeller}");
        if (user['email'] == data.name &&
            user['password'] == data.password &&
            user['isSeller'] == isSeller) {
          Logic.loginUser(user);
          return null;
        }
      }
      return "Please Check Your Credentials";
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      print("Logic.users");
      print(data.additionalSignupData?['Name']);
      for (Map<String, dynamic> user in Logic.users) {
        if (user['email'] == data.name) {
          return "User Already Exists.";
        }
      }

      int id = Random().nextInt(9999999);
      Map<String, dynamic> user = {
        "id": id.toString(),
        "email": data.name,
        "name": data.additionalSignupData?['Name'],
        "password": data.password,
        "isSeller": isSeller,
      };
      await Logic.addUser(user);
      Logic.loginUser(user);
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      return "";
      // if (!users.containsKey(name)) {
      //   return 'User not exists';
      // }
      // return "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'ECORP',
      logo: AssetImage('assets/images/login_logo.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      additionalSignupFields: [
        UserFormField(keyName: "Name"),
      ],
      hideForgotPasswordButton: true,
      onSubmitAnimationCompleted: () {
        if (isSeller) {
          Util.offAll(RootAppSeller());
        } else {
          Util.offAll(RootAppBuyer());
        }
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //   builder: (context) => RootApp(),
        // ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
