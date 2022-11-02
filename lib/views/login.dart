// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:flutter_application_project/config/config.dart';
import 'package:flutter_application_project/views/Homepage.dart';
import 'package:flutter_application_project/views/register.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'employee/MainEmp.dart';
import 'owner/Main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool hidepassword = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void initState() {
    super.initState();
    checkToken1();
  }

  checkToken1() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      headers?['Authorization'] = "bearer ${prefs.getString('token')}";
      if (prefs.getString('role') == 'C') {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Customerhome(index: 0)),
            (Route<dynamic> route) => false);
      } else if (prefs.getString('role') == 'S') {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => MainEmployee(
                      index: 0,
                    )),
            (Route<dynamic> route) => false);
      } else if (prefs.getString('role') == 'O') {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => HomepageOwn(
                      index: 0,
                    )),
            (Route<dynamic> route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(224, 182, 241, 134),
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 00),
              width: 300,
              height: 250,
              child: Image.asset(
                'assets/images/LogoApp.png',
              ),
            ),
            // ignore: prefer_const_constructors
            const Text(
              '   ร้านก๊ะนะห์ขนมจีนเส้นสด',
              style: TextStyle(
                  color: Color.fromARGB(255, 8, 64, 79),
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: username,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 17),
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          labelText: 'ชื่อผู้ใช้',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 9, 9, 9)),
                          hintText: 'ชื่อผู้ใช้',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 9, 9, 9)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 100, 101, 101),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 100, 101, 101),
                                  width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          prefixIcon: Icon(
                            Icons.account_circle,
                            size: 30,
                            color: Color.fromARGB(255, 2, 2, 2),
                          )),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                        controller: password,
                        obscureText: hidepassword,
                        decoration: InputDecoration(
                            labelText: 'รหัสผ่าน',
                            labelStyle: const TextStyle(
                                color: const Color.fromARGB(255, 9, 9, 9)),
                            hintText: 'รหัสผ่าน',
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 100, 101, 101)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 100, 101, 101)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              size: 30,
                              color: Color.fromARGB(255, 0, 0, 0),
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
                                  color:
                                      const Color.fromARGB(255, 100, 101, 101),
                                )))),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () async {
                        await checkLogin(username.text, password.text, context);
                      },
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Icon(Icons.login),
                          const Text(
                            'เข้าสู่ระบบ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        primary: Color.fromARGB(255, 3, 133, 255),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'หรือ',
                      style: TextStyle(
                          color: Color.fromARGB(255, 16, 16, 16), fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RegisterScreen();
                        }));
                      },
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Icon(Icons.person_add),
                          const Text('สร้างบัญชีผู้ใช้',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        primary: const Color.fromARGB(255, 46, 152, 252),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}
