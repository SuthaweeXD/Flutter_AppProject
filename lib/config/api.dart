import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/config.dart';
import 'package:flutter_application_project/views/homepage.dart';
import 'package:flutter_application_project/views/order/ConfirmOrders.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future checkRegister(
    fname, lname, phone, role, address, username, password, context) async {
  EasyLoading.show(status: 'loading...');

  Uri url = Uri.parse('http://206.189.92.71:3700/api/users');
  http
      .post(
    url,
    headers: headers,
    body: jsonEncode({
      "fname": fname,
      "lname": lname,
      "number": phone,
      "role": role,
      "address": address,
      "username": username,
      "password": password,
    }),
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 201) {
      final prefs = await SharedPreferences.getInstance();
      var data = jsonDecode(req.body);
      prefs.setString('token', data['token']);
      headers?['Authorization'] = "bearer ${data['token']}";
      EasyLoading.showSuccess('Great Success!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Customerhome(index: 0)),
          (Route<dynamic> route) => false);
    } else {
      print('error');
      EasyLoading.showError('Failed with Error');
    }
  });
}

Future checkLogin(String username, String password, context) async {
  EasyLoading.init();

  Uri url = Uri.parse('http://206.189.92.71:3700/api/users/login');
  http
      .post(
    url,
    headers: headers,
    body: jsonEncode({"username": username, "password": password}),
  )
      .then((req) async {
    if (req.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      var data = jsonDecode(req.body);
      prefs.setString('token', data['token']);
      prefs.setInt('idm', data['user_id']);
      headers?['Authorization'] = "bearer ${data['token']}";
      EasyLoading.showSuccess('Great Success!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Customerhome(index: 0)),
          (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('Failed with Error');
    }
  });
}

Future<dynamic> getdataprofile() async {
  final prefs =
      await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
  int? user_id = prefs.getInt('idm');
  Uri url = Uri.parse('http://206.189.92.71:3700/api/users/$user_id');

  return await http
      .get(
    url,
    headers: headers,
  )
      .then((req) async {
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      print(req.body);
      return data;
    } else {
      return null;
    }
  });
}

Future sendDataProfile1(fname, lname, phone, address, context) async {
  final prefs =
      await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
  int? user_id = prefs.getInt('idm');
  Uri url = Uri.parse('http://206.189.92.71:3700/api/users/$user_id');
  http
      .put(
    url,
    headers: headers,
    body: jsonEncode(
        {"fname": fname, "lname": lname, "number": phone, "address": address}),
  )
      .then((req) async {
    if (req.statusCode == 204) {
      EasyLoading.showSuccess('Great Success!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Customerhome(index: 0)),
          (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('Failed with Error');
    }
  });
}

Future<dynamic> getOrders() async {
  Uri url = Uri.parse('http://206.189.92.71:3700/api/orders');
  return await http
      .get(
    url,
  )
      .then((req) async {
    print(req.statusCode);
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      return data;
    } else {
      return null;
    }
  });
}

Future sendorders(small, big, roll, picdate, pictime, now, context) async {
  final prefs =
      await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
  int? userid = prefs.getInt('idm');
  Uri url = Uri.parse('http://206.189.92.71:3700/api/orders');
  http
      .post(
    url,
    headers: headers,
    body: jsonEncode({
      "userid": userid,
      "small": small,
      "big": big,
      "roll": roll,
      "ogetdate": picdate + ' ' + pictime,
      "odate": now
    }),
  )
      .then((req) async {
    print(req.statusCode);
    print(picdate);
    print(pictime);

    if (req.statusCode == 201) {
      EasyLoading.showSuccess('Great Success!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => ConfirmOrders()),
          (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('Failed with Error');
    }
  });
}
