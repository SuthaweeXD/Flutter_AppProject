// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:convert';
import 'package:flutter_application_project/views/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project/views/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../config/config.dart';
import '../views/customer/ProflieUpdate.dart';

class SideMenu extends StatefulWidget {
  SideMenu({
    Key? key,
    this.routeName,
  }) : super(key: key);

  final String? routeName;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
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
              color: Color.fromARGB(255, 230, 191, 35),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) => ProfileUpdate(
                                  data: null,
                                )));
                  }),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Image.asset('assets/images/user.png'),
                        backgroundColor: Colors.white,
                        radius: 50,
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
                                        color: Colors.white,
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
                            builder: (context) => Customerhome(index: 0),
                            //แก้ตรงนี้--------------------------------------------------------------------------------------
                          ),
                          (route) => false);
                    },
                    child: Text(
                      'หน้าหลัก',
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  // leading: Icon(FontAwesomeIcons.rightFromBracket),
                  title: Text(
                    'ออกจากระบบ',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.remove('token');
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                        (route) => false);
                  },
                ),
              ],
            ),
          ),
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
            MaterialPageRoute(builder: (context) => Customerhome(index: 0)),
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
