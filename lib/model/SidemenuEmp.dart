// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_project/views/employee/ChartDaily.dart';
import 'package:flutter_application_project/views/employee/MainEmp.dart';
import 'package:flutter_application_project/views/Login.dart';
import 'package:flutter_application_project/views/employee/ReportOrder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../config/config.dart';

class SideMenuEmp extends StatefulWidget {
  SideMenuEmp({
    Key? key,
    this.routeName,
  }) : super(key: key);

  final String? routeName;

  @override
  State<SideMenuEmp> createState() => _SideMenuEmpState();
}

class _SideMenuEmpState extends State<SideMenuEmp> {
  dynamic data;

  @override
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    //เอาตัวidของcustomerมาใช้กับหน้านี้แล้วเอาค่าไปใส่ในidUser
    dynamic item = await getdataprofile(); //ส่งค่าไปยัง getdataหรือตัวรับapi
    setState(() {
      data = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 129, 253, 28),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: GestureDetector(
                  onTap: (() {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute<void>(
                    //         builder: (BuildContext context) => ProfileUpdate(
                    //               data: null,
                    //             )));
                  }),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Image.asset('assets/images/user.png'),
                        backgroundColor: Colors.white,
                        radius: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            data != null
                                ? Text(
                                    ''' ${data['user_fname']}  ${data['user_lname']}''',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text(''),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(1, 5, 20, 5),
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainEmployee(index: 0),
                          ),
                          (route) => false);
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Icon(
                          Icons.home,
                          size: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'ข้อมูลการสั่งซื้อ',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainEmployee(index: 2),
                          ),
                          (route) => false);
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Icon(
                          Icons.history,
                          size: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'ประชาสัมพันธ์',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReportOrderEmp(),
                          ));
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Icon(
                          Icons.bar_chart,
                          size: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'สรุปการขาย',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChartDaily(),
                          ));
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Icon(
                          Icons.pie_chart_outline,
                          size: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'แผนภูมิประจำวัน',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(97, 20, 92, 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                backgroundColor: Color.fromARGB(255, 255, 0, 0),
                primary: const Color.fromARGB(255, 255, 255, 255),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('token');
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false);
              },
              child: const Text(
                'ออกจากระบบ',
              ),
            ),
          )
        ],
      ),
    );
  }

  ListTile routeItem(BuildContext context, Widget? leading, String name,
      String routeItemName) {
    return ListTile(
      selected: widget.routeName == routeItemName,
      selectedColor: Colors.lightGreen,
      leading: leading,
      title: Text(name),
      onTap: () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MainEmployee(index: 0)),
            (Route<dynamic> route) => false);
      },
    );
  }
}

Future<dynamic> getdataprofile() async {
  final prefs =
      await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
  int? user_id = prefs.getInt('idm');
  Uri url = Uri.parse('http://206.189.145.138:3700/api/users/$user_id');

  return await http
      .get(
    url,
    headers: headers,
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
