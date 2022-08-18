// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:flutter_application_project/model/TextModel.dart';
import 'package:flutter_application_project/model/sidemenu.dart';
import 'package:flutter_application_project/views/homepage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_project/config/config.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({Key? key, data}) : super(key: key);

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
    var item = await getdtprofile();
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
        backgroundColor: Color.fromARGB(255, 255, 182, 36),
        title: Text('ข้อมูลส่วนตัว'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://github.com/SuthaweeXD/images/blob/main/ACE.jpg?raw=true'),
                backgroundColor: Color.fromARGB(255, 255, 206, 121),
                radius: 60,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormFieldProfile(
                labelText: 'ชื่อ',
                controller: fname,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormFieldProfile(
                labelText: 'นามสกุล',
                controller: lname,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormFieldProfile(
                labelText: 'เบอร์โทรศัพท์',
                controller: phone,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormFieldProfile(
                labelText: 'ที่อยู่',
                controller: address,
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  sendDataProfile1(fname.text, lname.text, phone.text,
                      address.text, context);
                },
                child: const Text('ยืนยัน',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 27,
                        fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                  primary: Color.fromARGB(255, 77, 158, 88),
                ),
              )
            ],
          ),
        ),
      ),
      drawer: SideMenu(),
    );
  }
}

// Future<dynamic> getdataprofile() async {
//   final prefs =
//       await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
//   int? user_id = prefs.getInt('idm');
//   Uri url = Uri.parse('http://206.189.92.71:3700/api/users/$user_id');

//   return await http
//       .get(
//     url,
//     headers: headers,
//   )
//       .then((req) async {
//     if (req.statusCode == 200) {
//       var data = jsonDecode(req.body);
//       print(req.body);
//       return data;
//     } else {
//       return null;
//     }
//   });
// }

// Future sendDataProfile1(fname, lname, phone, address, context) async {
//   final prefs =
//       await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
//   int? user_id = prefs.getInt('idm');
//   Uri url = Uri.parse('http://192.168.1.144:3200/api/users/$user_id');
//   http
//       .put(
//     url,
//     headers: headers,
//     body: jsonEncode(
//         {"fname": fname, "lname": lname, "number": phone, "address": address}),
//   )
//       .then((req) async {
//     if (req.statusCode == 204) {
//       EasyLoading.showSuccess('Great Success!');
//       Navigator.of(context).pushAndRemoveUntil(
//           MaterialPageRoute(builder: (context) => Customerhome(index: 0)),
//           (Route<dynamic> route) => false);
//     } else {
//       EasyLoading.showError('Failed with Error');
//     }
//   });
// }
