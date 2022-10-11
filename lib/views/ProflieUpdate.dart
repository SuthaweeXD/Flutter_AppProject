// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:flutter_application_project/model/TextModel.dart';
import 'package:flutter_application_project/model/sidemenu.dart';
import 'package:flutter_application_project/views/Homepage.dart';
import 'package:flutter_application_project/views/Map.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
      print(data);

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
        backgroundColor: Color.fromARGB(255, 89, 160, 51),
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
                // child: Image.asset('assets/images/ACE.png'),
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
                onPressed: () {},
                child: const Text('เลือกที่อยู่',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                        fontWeight: FontWeight.w200)),
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  primary: Color.fromARGB(255, 28, 122, 255),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 240,
                  width: 500,
                  child: data != null
                      ? Card(
                          color: Color.fromARGB(255, 255, 236, 181),
                          shadowColor: const Color.fromARGB(255, 114, 114, 114),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          child: AddressMap(
                            lat: data['lat'],
                            lng: data['lng'],
                          ),
                        )
                      : Text('ไม่มีข้อมูล')),
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
