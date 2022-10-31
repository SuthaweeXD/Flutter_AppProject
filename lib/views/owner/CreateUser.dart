import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';

import '../../model/TextModel.dart';

class CreateUsers extends StatefulWidget {
  CreateUsers({Key? key}) : super(key: key);

  @override
  State<CreateUsers> createState() => _CreateUsersState();
}

class _CreateUsersState extends State<CreateUsers> {
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
      appBar: AppBar(),
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
                    'เพิ่มพนักงาน',
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
                    keytype: true,
                    maxlength: 10,
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
                    controller: address,
                    labelText: 'ที่อยู่',
                    hintText: 'ที่อยู่',
                    textError: 'กรุณากรอก',
                    helperText: 'กรอกที่อยู่',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormFieldModel(
                    controller: username,
                    labelText: 'ชื่อผู้ใช้',
                    hintText: 'ชื่อผู้ใช้',
                    textError: 'กรุณากรอก',
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
                        return 'กรุIากรอก';
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
                      labelStyle: TextStyle(color: Colors.black),
                      hintStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
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
                            color: Color.fromARGB(255, 70, 144, 255),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                        await CreateEmp(
                            fname.text,
                            lname.text,
                            phone.text,
                            address.text,
                            username.text,
                            password.text,
                            context);
                      }
                      print('สมัครสมาชิก');
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
