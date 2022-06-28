// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_project/views/Customerhome_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_project/config/config.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  dynamic data;

  @override
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    var item = await getdataprofile();
    setState(() {
      data = item;
      // data['user_fname'] != null
      //     ? fname.text = data['user_fname']
      //     : fname.text = "";
      fname.text = data['user_fname'];
      lname.text = data['user_lname'];
      phone.text = data['user_number'];
      address.text = data['user_address'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 169, 26, 205),
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: fname,
          ),
          TextFormField(
            controller: lname,
          ),
          TextFormField(
            controller: phone,
          ),
          TextFormField(
            controller: address,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              sendDataProfile1(
                  fname.text, lname.text, phone.text, address.text, context);
            },
            child: const Text('ยืนยัน'),
          )
        ],
      ),
    );
  }
}

Future<dynamic> getdataprofile() async {
  final prefs =
      await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
  int? user_id = prefs.getInt('idm');
  Uri url = Uri.parse('http://192.168.43.18:3200/api/users/$user_id');

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
  Uri url = Uri.parse('http://192.168.43.18:3200/api/users/$user_id');
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
          MaterialPageRoute(builder: (context) => Customerhome()),
          (Route<dynamic> route) => false);
    } else {
      EasyLoading.showError('Failed with Error');
    }
  });
}
