// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:flutter_application_project/model/TextModel.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
  TextEditingController address = TextEditingController();
  bool hidepassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ลงทะเบียน'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Form(
              key: _formkey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 750,
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
                    textError: 'กรุณากรอกให้ถูกต้อง',
                    helperText: 'กรุณากรอกชื่อ',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormFieldModel(
                    controller: lname,
                    labelText: 'นามสกุล',
                    hintText: 'นามสกุล',
                    textError: 'กรุณากรอกให้ถูกต้อง',
                    helperText: 'กรุณากรอกนามสกุล',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormFieldModel(
                    keytype: true,
                    maxlength: 10,
                    controller: phone,
                    labelText: 'เบอร์โทรศัพท์',
                    hintText: 'เบอร์โทรศัพท์',
                    textError: 'กรุณากรอกให้ถูกต้อง',
                    helperText: 'กรุณากรอกเบอร์โทรศัพท์',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormFieldModel(
                    controller: address,
                    labelText: 'ที่อยู่',
                    hintText: 'ที่อยู่',
                    textError: 'กรุณากรอกให้ถูกต้อง',
                    helperText: 'กรอกที่อยู่',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormFieldModel(
                    controller: username,
                    labelText: 'ชื่อผู้ใช้',
                    hintText: 'ชื่อผู้ใช้',
                    textError: 'กรุณากรอกให้ถูกต้อง',
                    helperText: 'กรอกชื่อผู้ใช้',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: password,
                    obscureText: hidepassword,

                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอกให้ถูกต้อง';
                      } else {
                        return value.length < 6
                            ? 'กรอกรหัสผ่านอย่างน้อย 6 ตัว'
                            : null;
                      }
                    },
                    // ignore: prefer_const_constructors
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'รหัสผ่าน',
                      hintText: 'รหัสผ่าน',
                      helperText: 'กรอกรหัสผ่านอย่างน้อย 6 ตัว',
                      labelStyle: const TextStyle(color: Colors.black),
                      hintStyle: const TextStyle(color: Colors.black),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30),
                        ),
                      ),
                      suffixIcon: IconButton(
                          onPressed: (() {
                            setState(() {
                              hidepassword = !hidepassword;
                            });
                          }),
                          icon: Icon(
                            hidepassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 30,
                            color: const Color.fromARGB(255, 70, 144, 255),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 77, 158, 88),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState?.save();
                          dynamic checkSameUser =
                              await checkSuser(username.text);
                          print(checkSameUser);
                          if (checkSameUser['CheckS'] != 0) {
                            EasyLoading.showError('ชื่อผู้ใช้งานซ้ำ !');
                          } else {
                            await checkRegister(
                                fname.text,
                                lname.text,
                                phone.text,
                                address.text,
                                username.text,
                                password.text,
                                context);
                          }
                        }
                        print('สมัครสมาชิก');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Icon(Icons.person_add_alt),
                            const Text(
                              '       ยืนยัน',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
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
