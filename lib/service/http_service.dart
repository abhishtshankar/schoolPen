import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import '../screens/dashboard.dart';
import '../screens/sign_up_step2.dart';
import '../screens/verify_email.dart';
import '../screens/welcome_screen.dart';


class HttpService {
  static final _client = http.Client();

  static var _loginUrl = Uri.parse('http://localhost:5000//login');

  static var _verifyUrl = Uri.parse('http://localhost:5000/verify-code');
  static var _signUpStep1Url = Uri.parse('http://localhost:5000/signup-step1');
   static var _signUpStep2Url = Uri.parse('http://localhost:5000/signup-step2');
  

  static signupStep1(username,email ,password,retypePassword,mobileNumber, context) async {
    http.Response response = await _client.post(_signUpStep1Url, body: {
      'uname': username,
      'email':email,
      'passw': password,
      'repass':retypePassword,
      'mobno':mobileNumber
    });

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      var json = jsonDecode(response.body);

      if (response.statusCode != 400) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => VerifyEmail(email: email)));
      } else {
        EasyLoading.showError(json['status']);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }
  static verifyCode(email, context) async {
    http.Response response = await _client.post(_verifyUrl, body: {
      'email':email
    
    });

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      var json = jsonDecode(response.body);

      if (json['status'] == 'Verification successful. Please complete the signup process.') {
       EasyLoading.showSuccess(json['status']);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => SignUpStep2Screen()));
      } else {
        EasyLoading.showError(json['status']);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }

  static login(email, pass, context) async {
    http.Response response = await _client.post(_loginUrl, body: {
      'mail': email,
      'passw': pass,
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json['status'] == 'Login successful. You can access the dashboard now.') {
        await EasyLoading.showError(json['status']);
      } else {
        await EasyLoading.showSuccess(json['status']);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => WelcomeScreen()));
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }
  static signupStep2(email,instituteName ,address,udiseCode,document, context) async {
    http.Response response = await _client.post(_signUpStep2Url, body: {
      'email': email,
      'instName':instituteName,
      'address': address,
      'udiseCode':udiseCode,
      'document':document
    });

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      var json = jsonDecode(response.body);

      if (response.statusCode != 400) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Dashboard()));
      } else {
        EasyLoading.showError(json['status']);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }
}
