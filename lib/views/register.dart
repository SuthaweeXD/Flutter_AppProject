import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:flutter_application_project/model/TextModel.dart';
import 'package:flutter_application_project/views/homepage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_project/config/config.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController role = TextEditingController();
  TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ลงทะเบียน'),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Form(
              key: _formkey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  Text(
                    'ลงทะเบียน',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[300],
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormFieldModel(
                    controller: fname,
                    labelText: 'ชื่อ',
                    hintText: 'ชื่อ',
                    textError: 'กรุณากรอก',
                    helperText: 'กรุณากรอกชื่อ',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormFieldModel(
                    controller: lname,
                    labelText: 'นามสกุล',
                    hintText: 'นามสกุล',
                    textError: 'กรุณากรอก',
                    helperText: 'กรุณากรอกนามสกุล',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormFieldModel(
                    controller: phone,
                    labelText: 'เบอร์โทรศัพท์',
                    hintText: 'เบอร์โทรศัพท์',
                    textError: 'กรุณากรอก',
                    helperText: 'กรุณากรอกเบอร์โทรศัพท์',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormFieldModel(
                    controller: role,
                    labelText: 'ประเภทผู้ใช้งาน',
                    hintText: 'ประเภทผู้ใช้งาน',
                    textError: 'กรุณากรอก',
                    helperText: 'กรอกประเภทผู้ใช้งาน ลูกค้า: C ,พนักงาน: S  ',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormFieldModel(
                    controller: address,
                    labelText: 'ที่อยู่',
                    hintText: 'ที่อยู่',
                    textError: 'กรุณากรอก',
                    helperText: 'กรอกที่อยู่',
                  ),
                  TextFormFieldModel(
                    controller: username,
                    labelText: 'ชื่อผู้ใช้',
                    hintText: 'ชื่อผู้ใช้',
                    textError: 'กรุณากรอก',
                    helperText: 'กรอกชื่อผู้ใช้',
                  ),
                  TextFormFieldModel(
                    controller: password,
                    labelText: 'รหัสผ่าน',
                    hintText: 'รหัสผ่าน',
                    textError: 'กรุณากรอก',
                    helperText: 'กรอกรหัสผ่านอย่างน้อย 6 ตัว',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 77, 158, 88),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState?.save();
                      }
                      print('สมัครสมาชิก');

                      await checkRegister(
                          fname.text,
                          lname.text,
                          phone.text,
                          role.text,
                          address.text,
                          username.text,
                          password.text,
                          context);
                    },
                    child: Text(
                      'ยืนยัน',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
